import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

MockGraphQLClient generateMockGraphQLClient() {
  final graphQLClient = MockGraphQLClient();
  final queryManager = MockQueryManager();

  when(() => graphQLClient.defaultPolicies).thenReturn(DefaultPolicies());
  when(() => graphQLClient.queryManager).thenReturn(queryManager);

  return graphQLClient;
}

MockQueryResult generateMockQuery(MockGraphQLClient graphQLClient) {
  final result = MockQueryResult();
  final queryManager = graphQLClient.queryManager;

  when(() => graphQLClient.query(any())).thenAnswer((_) async => result);
  when(() => queryManager.query(any())).thenAnswer((_) async => result);

  return result;
}

MockQueryResult generateMockWatchQuery(MockGraphQLClient graphQLClient) {
  registerFallbackValue(_FakeWatchQueryOptions());

  final query = MockObservableQuery();
  final result = MockQueryResult();
  final queryManager = graphQLClient.queryManager;

  when(query.close).thenReturn(QueryLifecycle.closed);
  when(() => query.stream).thenAnswer((_) => Stream.value(result));
  when(() => query.latestResult).thenReturn(result);
  // ignore: void_checks
  when(() => query.onData(any())).thenReturn(() {});
  when(() => graphQLClient.watchQuery(any())).thenReturn(query);
  when(() => queryManager.watchQuery(any())).thenReturn(query);

  return result;
}

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryManager extends Mock implements QueryManager {}

class MockQueryResult extends Mock implements QueryResult {}

class _FakeWatchQueryOptions extends Fake implements WatchQueryOptions {}

class MockObservableQuery extends Mock implements ObservableQuery {}

class _FakeMutationOptions extends Fake implements MutationOptions {}
