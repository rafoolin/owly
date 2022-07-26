import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/todo_category.dart';
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
}
