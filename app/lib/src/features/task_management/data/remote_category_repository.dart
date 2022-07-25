import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/task_category.dart';

class RemoteCategoryRepository {
  final GraphQLClient _qlClient;
  RemoteCategoryRepository(this._qlClient);

  Stream<AsyncValue<List<TaskCategory>>> watchCategories() {
    const query = '''query {
      categories{
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
        .watchQuery(WatchQueryOptions(fetchResults: true, document: gql(query)))
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
          categories.map((json) => TaskCategory.fromJson(json)).toList(),
        );
      }
      return const AsyncData([]);
    });
  }
}
