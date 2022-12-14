import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/todo_category.dart';
import '../domain/todo_task.dart';

class RemoteCategoryRepository {
  final GraphQLClient _qlClient;
  RemoteCategoryRepository(this._qlClient);

  Stream<AsyncValue<List<TodoCategory>>> subscribeCategories() {
    const query = '''subscription {
      categories {
        __typename
        id
        name
        color
        updateAt
        userId
        createdAt
        taskCount: tasks_aggregate {
          aggregate {
            count
          }
        }
      }
    }''';

    return _qlClient
        .subscribe(SubscriptionOptions(
      document: gql(query),
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
        taskCount: tasks_aggregate {
          aggregate {
            count
          }
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

  Stream<AsyncValue<TodoCategory>> subscribeCategory(String categoryId) {
    const query = '''subscription (\$id: uuid!) {
      categories_by_pk(id: \$id) {
        __typename
        id
        name
        color
        updateAt
        userId
        createdAt
        taskCount: tasks_aggregate {
          aggregate {
            count
          }
        }
      }
    }''';

    return _qlClient
        .subscribe(SubscriptionOptions(
      document: gql(query),
      variables: {'id': categoryId},
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ))
        .map((result) {
      if (result.isLoading) {
        return const AsyncLoading();
      }

      if (result.hasException) {
        return AsyncError(result.exception!);
      }

      final category = result.data!['categories_by_pk'];
      // TODO:: Cover it in converter
      final taskCount = category['taskCount']['aggregate']['count'];
      category['totalTasks'] = taskCount;
      if (category != null) {
        return AsyncData(TodoCategory.fromJson(category));
      }
      return AsyncError(Exception('Category do not exist!'));
    });
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
    required String id,
    required String name,
    Color? color,
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
        'id': id,
        'name': name,
        if (color != null) 'color': color.value,
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
