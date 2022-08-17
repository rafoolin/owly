import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../task_management/domain/todo_task.dart';

class RemoteOverviewRepository {
  final GraphQLClient _qlClient;
  RemoteOverviewRepository(this._qlClient);

  final _dateFormatter = DateFormat('yyyy-MM-dd');

  Stream<AsyncValue<List<TodoTask>>> subscribeTasksOnDate(DateTime date) {
    const query = '''subscription (\$date: date) {
      vm_tasks_on_date(where: {dueDate: {_eq: \$date}}) {
        __typename
        id
        userId
        title
        completed
        note
        categoryId
        categoryColor
        dueDatetime
        createdAt
        createdAt
        completedAt
        sub_tasks {
          __typename
          id
          title
          completed
          dueAt
          note
          userId
          taskId
          createdAt
          updatedAt
        }
      }
    }''';

    return _qlClient
        .subscribe(SubscriptionOptions(
      document: gql(query),
      variables: {'date': _dateFormatter.format(date)},
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ))
        .map((result) {
      if (result.isLoading) {
        return const AsyncLoading();
      }

      if (result.hasException) {
        return AsyncError(result.exception!);
      }

      if (result.data != null) {
        final tasks = result.data!['vm_tasks_on_date'] as List;
        return AsyncData(
          tasks.map((json) => TodoTask.fromJson(json)).toList(),
        );
      }
      return const AsyncData([]);
    });
  }
}
