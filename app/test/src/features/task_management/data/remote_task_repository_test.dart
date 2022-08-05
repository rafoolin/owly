import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:owly/src/common/models/converters.dart';
import 'package:owly/src/features/task_management/data/remote_task_repository.dart';
import 'package:owly/src/features/task_management/domain/todo_sub_task.dart';
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
const taskId = 'task-id';

void main() async {
  late RemoteTaskRepository remoteTaskRepository;
  late MockGraphQLClient mockGraphQLClient;

  setUp(() {
    mockGraphQLClient = generateMockGraphQLClient();
    remoteTaskRepository = RemoteTaskRepository(mockGraphQLClient, taskId);
  });

  // TODO:: Test subscription
  group('subscribeTask -', () {
    final time = DateTime.now();
    final timeOdDay = TimeOfDay.now();
    final jsonData = {
      'tasks_by_pk': {
        '__typename': 'tasks',
        'id': taskId,
        'userId': user.id,
        'title': 'title',
        'completed': false,
        'note': 'note',
        'categoryId': 'category-id',
        'categoryColor': 0,
        'dueDatetime': time.add(const Duration(minutes: 1)).toIso8601String(),
        'createdAt': time.toIso8601String(),
        'completedAt': null,
        'sub_tasks': [
          {
            '__typename': 'sub_tasks',
            'id': 'sub-task',
            'title': 'sub-title',
            'completed': false,
            'dueAt': const TimeZConverter().toJson(timeOdDay),
            'note': null,
            'userId': user.id,
            'taskId': taskId,
            'createdAt': time.toIso8601String(),
            'updatedAt': null
          }
        ],
      }
    };

    final finalData = TodoTask(
      id: taskId,
      title: 'title',
      userId: user.id,
      createdAt: time,
      categoryId: 'category-id',
      dueDatetime: time.add(const Duration(minutes: 1)),
      categoryColor: Colors.transparent,
      completed: false,
      completedAt: null,
      indexValue: null,
      note: 'note',
      subTasks: [
        TodoSubTask(
          id: 'sub-task',
          title: 'sub-title',
          completed: false,
          dueAt: timeOdDay,
          note: null,
          taskId: taskId,
          createdAt: time,
          updatedAt: null,
          completedAt: null,
          indexValue: null,
        )
      ],
    );
    test('Loading state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(true);
      expect(
        remoteTaskRepository.watchTask(),
        emits(const AsyncLoading<TodoTask>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });

    test('Error state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(false);
      when(() => result.hasException).thenReturn(true);
      when(() => result.exception).thenReturn(OperationException());

      expect(
        remoteTaskRepository.watchTask(),
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
        remoteTaskRepository.watchTask(),
        emits(isA<AsyncData>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
      remoteTaskRepository.watchTask().listen((event) {
        expect(event.value?.id, contains(finalData.id));
        expect(event.value?.subTasks.first, finalData.subTasks.first);
      });
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });
  });
  group('watchTask -', () {
    final time = DateTime.now();
    final timeOdDay = TimeOfDay.now();
    final jsonData = {
      'tasks_by_pk': {
        '__typename': 'tasks',
        'id': taskId,
        'userId': user.id,
        'title': 'title',
        'completed': false,
        'note': 'note',
        'categoryId': 'category-id',
        'categoryColor': 0,
        'dueDatetime': time.add(const Duration(minutes: 1)).toIso8601String(),
        'createdAt': time.toIso8601String(),
        'completedAt': null,
        'sub_tasks': [
          {
            '__typename': 'sub_tasks',
            'id': 'sub-task',
            'title': 'sub-title',
            'completed': false,
            'dueAt': const TimeZConverter().toJson(timeOdDay),
            'note': null,
            'userId': user.id,
            'taskId': taskId,
            'createdAt': time.toIso8601String(),
            'updatedAt': null
          }
        ],
      }
    };

    final finalData = TodoTask(
      id: taskId,
      title: 'title',
      userId: user.id,
      createdAt: time,
      categoryId: 'category-id',
      dueDatetime: time.add(const Duration(minutes: 1)),
      categoryColor: Colors.transparent,
      completed: false,
      completedAt: null,
      indexValue: null,
      note: 'note',
      subTasks: [
        TodoSubTask(
          id: 'sub-task',
          title: 'sub-title',
          completed: false,
          dueAt: timeOdDay,
          note: null,
          taskId: taskId,
          createdAt: time,
          updatedAt: null,
          completedAt: null,
          indexValue: null,
        )
      ],
    );
    test('Loading state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(true);
      expect(
        remoteTaskRepository.watchTask(),
        emits(const AsyncLoading<TodoTask>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });

    test('Error state', () async {
      final result = generateMockWatchQuery(mockGraphQLClient);

      when(() => result.isLoading).thenReturn(false);
      when(() => result.hasException).thenReturn(true);
      when(() => result.exception).thenReturn(OperationException());

      expect(
        remoteTaskRepository.watchTask(),
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
        remoteTaskRepository.watchTask(),
        emits(isA<AsyncData>()),
      );
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
      remoteTaskRepository.watchTask().listen((event) {
        expect(event.value?.id, contains(finalData.id));
        expect(event.value?.subTasks.first, finalData.subTasks.first);
      });
      verify(() => mockGraphQLClient.watchQuery(captureAny())).called(1);
    });
  });
}
