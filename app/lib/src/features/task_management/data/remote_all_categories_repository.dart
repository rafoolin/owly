import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/todo_category.dart';

class RemoteAllCategoriesRepository {
  final GraphQLClient _qlClient;
  RemoteAllCategoriesRepository(this._qlClient);

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
}
