import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/domain/todo_task.dart';

class RemoteTodayRepository {
  final GraphQLClient _qlClient;
  RemoteTodayRepository(this._qlClient);

  Stream<AsyncValue<List<TodoTask>>> watchTodayTasks() {
    const query = '''query {
      vm_today_tasks {
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
        .watchQuery(WatchQueryOptions(
          fetchResults: true,
          document: gql(query),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ))
        .stream
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
            ..sort(((a, b) => a.dueDatetime.compareTo(b.dueDatetime))),
        );
      }
      return const AsyncData([]);
    });
  }
}
