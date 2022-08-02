import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/domain/todo_task.dart';

class RemoteTodayRepository {
  final GraphQLClient _qlClient;
  RemoteTodayRepository(this._qlClient);

  Stream<AsyncValue<List<TodoTask>>> watchTodayTasks() {
    const query = '''subscription {
      vm_today_tasks(order_by: {dueDatetime: asc}) {
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
        .subscribe(
      SubscriptionOptions(
        document: gql(query),
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      ),
    )
        .map((result) {
      if (result.isLoading) {
        return const AsyncLoading();
      }

      if (result.hasException) {
        return AsyncError(result.exception!);
      }

      if (result.data != null) {
        final tasks = result.data!['vm_today_tasks'] as List;
        return AsyncData(
          tasks.map((json) => TodoTask.fromJson(json)).toList()
            ..sort(
              ((a, b) {
                if (a.completed == b.completed) {
                  return 0;
                } else if (a.completed) {
                  return 1;
                }
                return -1;
              }),
            ),
        );
      }
      return const AsyncData([]);
    });
  }
}
