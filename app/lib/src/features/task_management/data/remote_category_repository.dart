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
          categories.map((json) => TodoCategory.fromJson(json)).toList(),
        );
      }
      return const AsyncData([]);
    });
  }

  Stream<AsyncValue<List<TodoTask>>> watchTasksByCategoryId(String categoryId) {
    const query = '''query (\$categoryId: uuid!) {
      vm_user_tasks(where: {categoryId: {_eq: \$categoryId}}) {
        __typename
        id
        title
        completed
        note
        parentId
        userId
        categoryId
        createdAt
        createdAt
        completedAt
        dateTime
        sub_tasks {
          __typename
          id
          title
          completed
          completedAt
          dateTime
          note
          parentId
          userId
          categoryId
          createdAt
          updatedAt
        }
      }
    }''';

    return _qlClient
        .watchQuery(WatchQueryOptions(
          fetchResults: true,
          document: gql(query),
          variables: {'categoryId': categoryId},
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
        final tasks = result.data!['vm_user_tasks'] as List;
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
}
