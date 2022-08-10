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

MockQueryResult generateMockSubscribe(MockGraphQLClient graphQLClient) {
  registerFallbackValue(_FakeWatchQueryOptions());
  registerFallbackValue(_FakeSubscriptionOptions());
  final query = MockObservableQuery();
  final result = MockQueryResult();
  final queryManager = graphQLClient.queryManager;

  when(query.close).thenReturn(QueryLifecycle.closed);
  when(() => query.stream).thenAnswer((_) => Stream.value(result));
  when(() => query.latestResult).thenReturn(result);
  // ignore: void_checks
  when(() => query.onData(any())).thenReturn(() {});
  when(() => graphQLClient.subscribe(any())).thenAnswer((_) => query.stream);
  when(() => queryManager.subscribe(any())).thenAnswer((_) => query.stream);

  return result;
}

MockQueryResult generateMockMutation(MockGraphQLClient graphQLClient) {
  registerFallbackValue(_FakeMutationOptions());

  final result = MockQueryResult();
  when(() => graphQLClient.mutate(any())).thenAnswer((_) async => result);

  final queryManager = graphQLClient.queryManager;
  when(() => queryManager.mutate(any())).thenAnswer((_) async => result);

  return result;
}

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryManager extends Mock implements QueryManager {}

class MockQueryResult extends Mock implements QueryResult {}

class _FakeWatchQueryOptions extends Fake implements WatchQueryOptions {}

class _FakeSubscriptionOptions extends Fake implements SubscriptionOptions {}

class MockObservableQuery extends Mock implements ObservableQuery {}

class _FakeMutationOptions extends Fake implements MutationOptions {}
