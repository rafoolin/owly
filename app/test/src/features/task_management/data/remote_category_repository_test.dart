import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:owly/src/features/task_management/data/remote_category_repository.dart';
import 'package:owly/src/features/task_management/domain/todo_category.dart';
import 'package:owly/src/features/task_management/domain/todo_task.dart';

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
      TodoCategory(
        id: 'id',
        name: 'name',
        userId: 'userId',
        createdAt: time,
        totalTasks: 0,
      )
    ];
    test('Loading state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(true);
      expect(
        remoteCategoryRepository.watchCategories(),
        emits(const AsyncLoading<List<TodoCategory>>()),
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

  group('watchTasksByCategoryId -', () {
    final time = DateTime.now();
    const categoryId = 'categoryId';

    final jsonData = {
      'vm_user_tasks': [
        {
          '__typename': 'tasks',
          'id': 'taskId',
          'title': 'title',
          'completed': false,
          'note': null,
          'parentId': null,
          'userId': 'userId',
          'categoryId': categoryId,
          'createdAt': time.toIso8601String(),
          'completedAt': null,
          'dueDatetime': time.add(const Duration(days: 1)).toIso8601String(),
          'sub_tasks': []
        }
      ]
    };

    final finalData = [
      TodoTask(
        id: 'taskId',
        title: 'title',
        userId: 'userId',
        categoryId: categoryId,
        createdAt: time,
        dueDatetime: time.add(const Duration(days: 1)),
      ),
    ];
    test('Loading state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(true);
      expect(
        remoteCategoryRepository.subscribeTasks(categoryId),
        emits(const AsyncLoading<List<TodoTask>>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });

    test('Error state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(false);
      when(() => result.hasException).thenReturn(true);
      when(() => result.exception).thenReturn(OperationException());

      expect(
        remoteCategoryRepository.subscribeTasks(categoryId),
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
        remoteCategoryRepository.subscribeTasks(categoryId),
        emits(isA<AsyncData>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
      remoteCategoryRepository.subscribeTasks(categoryId).listen((event) {
        expect(event.value, contains(finalData.first));
      });
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });
  });
}
