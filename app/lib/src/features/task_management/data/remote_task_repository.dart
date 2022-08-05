import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/todo_sub_task.dart';
import '../domain/todo_task.dart';

class RemoteTaskRepository {
  final GraphQLClient _qlClient;
  final String taskId;
  RemoteTaskRepository(this._qlClient, this.taskId);

  Stream<AsyncValue<TodoTask>> subscribeTask() {
    const query = '''subscription (\$id: uuid!) {
      tasks_by_pk(id: \$id) {
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
        sub_tasks (order_by: {title: asc}){
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
      variables: {'id': taskId},
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ))
        .map((result) {
      if (result.isLoading) {
        return const AsyncLoading();
      }

      if (result.hasException) {
        return AsyncError(result.exception!);
      }
      final task = result.data?['tasks_by_pk'];
      if (task != null) {
        return AsyncData(TodoTask.fromJson(task));
      }
      return AsyncError(Exception('Task do not exist!'));
    });
  }

  Stream<AsyncValue<TodoTask>> watchTask() {
    const query = '''query (\$id: uuid!) {
      tasks_by_pk(id: \$id) {
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
        sub_tasks (order_by: {title: asc}){
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
          variables: {'id': taskId},
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
      final task = result.data?['tasks_by_pk'];
      if (task != null) {
        return AsyncData(TodoTask.fromJson(task));
      }
      return AsyncError(Exception('Task do not exist!'));
    });
  }

  Future<void> markTaskAsDone({bool completed = false}) async {
    const query = '''mutation (\$id: uuid!, \$completed: Boolean = false) {
      update_tasks_by_pk(pk_columns: {id: \$id}, _set: {completed: \$completed}) {
        __typename
        completed
      }
    }''';

    await _qlClient.mutate(MutationOptions(
      document: gql(query),
      variables: {'id': taskId, 'completed': completed},
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ));
  }

  Future<void> updateSubTaskStatus(
    String id, {
    bool completed = false,
  }) async {
    const query = '''mutation (\$id: uuid!, \$completed: Boolean = false) {
      update_sub_tasks_by_pk(pk_columns: {id: \$id}, _set: {completed: \$completed}) {
        __typename
        completed
      }
    }''';

    await _qlClient.mutate(MutationOptions(
      document: gql(query),
      variables: {'id': id, 'completed': completed},
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ));
  }

  Future<void> deleteTask() async {
    const query = '''mutation (\$id: uuid!) {
      delete_tasks_by_pk(id: \$id) {
        __typename
        id
      }
    }''';

    await _qlClient.mutate(MutationOptions(
      document: gql(query),
      variables: {'id': taskId},
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ));
  }

  Future<void> editTask({
    required String? title,
    required String? categoryId,
    required DateTime? dueDatetime,
    String? note,
    List<TodoSubTask> addedSubTasks = const [],
    List<TodoSubTask> removedSubTasks = const [],
  }) async {
    const query = '''mutation (\$id: uuid!, \$set: tasks_set_input!, 
    \$added_sub_tasks: [sub_tasks_insert_input!] = [], \$removed_ids: [uuid!] = []) {
  update_tasks_by_pk(pk_columns: {id: \$id}, _set: \$set) {
    __typename
    completed
  }
  delete_sub_tasks(where: {id: {_in: \$removed_ids}}) {
    affected_rows
  }
  insert_sub_tasks(objects: \$added_sub_tasks, 
  on_conflict: {constraint: sub_tasks_pkey, 
  update_columns: [title, completed, dueAt, note]}) {
    affected_rows
  }
}
''';

    await _qlClient.mutate(MutationOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: {
        'id': taskId,
        'set': {
          if (categoryId != null) 'categoryId': categoryId,
          if (dueDatetime != null) 'dueDatetime': dueDatetime.toIso8601String(),
          if (note != null) 'note': note,
          if (title != null) 'title': title,
        },
        if (addedSubTasks.isNotEmpty)
          'added_sub_tasks': addedSubTasks
              .map(
                (s) => {
                  'title': s.title,
                  'taskId': s.taskId,
                },
              )
              .toList(),
        if (removedSubTasks.isNotEmpty)
          'removed_ids': removedSubTasks.map((s) => s.id).toList(),
      },
    ));
  }
}
