import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/todo_category.dart';
import '../domain/todo_sub_task.dart';
import '../domain/todo_task.dart';

class RemoteCategoryRepository {
  final GraphQLClient _qlClient;
  RemoteCategoryRepository(this._qlClient);

  Stream<AsyncValue<List<TodoCategory>>> watchCategories() {
    const query = '''query {
      categories {
        __typename
        id
        name
        color
        updateAt
        userId
        createdAt
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
        final categories = result.data!['categories'] as List;
        return AsyncData(
          categories.map((json) {
            // TODO:: Cover it in converter
            final taskCount = json['taskCount']['aggregate']['count'];
            json['totalTasks'] = taskCount;
            return TodoCategory.fromJson(json);
          }).toList(),
        );
      }
      return const AsyncData([]);
    });
  }

  Stream<AsyncValue<List<TodoTask>>> subscribeTasks(String categoryId) {
    const query = '''subscription (\$categoryId: uuid!) {
      tasks(where: {categoryId: {_eq: \$categoryId}}) {
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
      variables: {'categoryId': categoryId},
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
        final tasks = result.data!['tasks'] as List;
        return AsyncData(
          tasks.map((json) => TodoTask.fromJson(json)).toList(),
        );
      }
      return const AsyncData([]);
    });
  }

  Future<void> addTask({
    required String title,
    required String categoryId,
    required DateTime dueDatetime,
    String? note,
    List<TodoSubTask> subTasks = const [],
  }) async {
    const mutation = '''mutation (\$categoryId: uuid!, 
      \$dueDatetime: timestamptz!, \$note: String, \$title: String!, 
      \$sub_tasks: [sub_tasks_insert_input!] = []) {
    insert_tasks_one(object: {categoryId: \$categoryId, 
    dueDatetime: \$dueDatetime, note: \$note, title: \$title, 
    sub_tasks: {data: \$sub_tasks}}) {
      id
    }
  }
''';

    await _qlClient.mutate(MutationOptions(
      document: gql(mutation),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: {
        'title': title,
        'categoryId': categoryId,
        'dueDatetime': dueDatetime.toIso8601String(),
        if (note != null) 'note': note,
        'sub_tasks': subTasks
            .map(
              (s) => {'title': s.title},
            )
            .toList(),
      },
    ));
  }

  Future<void> addCategory({required String name, required Color color}) async {
    const mutation = '''mutation (\$name: String!, \$color: bigint = 0) {
      insert_categories_one(object: {name: \$name, color: \$color}) {
        id
      }
    }''';

    await _qlClient.mutate(MutationOptions(
      document: gql(mutation),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: {
        'name': name,
        'color': color.value,
      },
    ));
  }

  Future<void> editCategory({
    required String name,
    required Color color,
  }) async {
    const mutation = '''mutation (\$id: uuid!, \$name: String!, 
        \$color: bigint = 0) {
      update_categories_by_pk(pk_columns: {id: \$id}, _set: {color: 
      \$color, name: \$name}) {
        id
      }
    }''';

    await _qlClient.mutate(MutationOptions(
      document: gql(mutation),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: {
        'name': name,
        'color': color.value,
      },
    ));
  }

  Future<void> deleteCategory(String id) async {
    const mutation = '''mutation MyMutation(\$id: uuid!) {
      delete_categories_by_pk(id: \$id) {
        id
      }
    }''';

    await _qlClient.mutate(MutationOptions(
      document: gql(mutation),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: {'id': id},
    ));
  }
}
