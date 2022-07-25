import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:owly/src/features/task_management/data/remote_category_repository.dart';
import 'package:owly/src/features/task_management/domain/task_category.dart';

import '../helpers/helper.dart';

const testEmail = 'user-1@nhost.io';
const testPassword = 'password-1';
final user = User(
  id: 'id',
  displayName: 'displayName',
  locale: 'en',
  createdAt: DateTime.now(),
  isAnonymous: false,
  defaultRole: 'user',
  roles: ['user', 'own'],
);

void main() async {
  late RemoteCategoryRepository remoteCategoryRepository;
  late MockGraphQLClient mockGraphQLClient;

  setUp(() {
    mockGraphQLClient = generateMockGraphQLClient();
    remoteCategoryRepository = RemoteCategoryRepository(mockGraphQLClient);
  });

  group('watchCategories -', () {
    final time = DateTime.now();
    final jsonData = {
      'categories': [
        {
          'id': 'id',
          'name': 'name',
          'userId': 'userId',
          'color': null,
          'updatedAt': null,
          'createdAt': time.toIso8601String(),
        }
      ]
    };

    final finalData = [
      TaskCategory(
        id: 'id',
        name: 'name',
        userId: 'userId',
        createdAt: time,
      )
    ];
    test('Loading state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(true);
      expect(
        remoteCategoryRepository.watchCategories(),
        emits(const AsyncLoading<List<TaskCategory>>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });

    test('Error state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(false);
      when(() => result.hasException).thenReturn(true);
      when(() => result.exception).thenReturn(OperationException());

      expect(
        remoteCategoryRepository.watchCategories(),
        emits(isA<AsyncError>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });

    test('Data state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(false);
      when(() => result.hasException).thenReturn(false);
      when(() => result.data).thenReturn(jsonData);

      expect(
        remoteCategoryRepository.watchCategories(),
        emits(isA<AsyncData>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
      remoteCategoryRepository.watchCategories().listen((event) {
        expect(event.value, contains(finalData.first));
      });
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });
  });
}
