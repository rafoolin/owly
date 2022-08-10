import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/todo_category.dart';

class RemoteAllCategoriesRepository {
  final GraphQLClient _qlClient;
  RemoteAllCategoriesRepository(this._qlClient);

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
