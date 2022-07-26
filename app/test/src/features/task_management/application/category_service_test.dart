import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:owly/src/features/task_management/data/remote_category_repository.dart';
import 'package:owly/src/features/task_management/domain/todo_category.dart';
import 'package:owly/src/features/task_management/domain/todo_task.dart';
import 'category_service_test.mocks.dart';

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

@GenerateMocks([RemoteCategoryRepository])
void main() async {
  late RemoteCategoryRepository remoteCategoryRepository;

  setUp(() {
    remoteCategoryRepository = MockRemoteCategoryRepository();
  });

  group('watchCategories -', () {
    final time = DateTime.now();

    final finalData = [
      TodoCategory(
        id: 'id',
        name: 'name',
        userId: 'userId',
        createdAt: time,
      )
    ];
    test('Success', () async {
      when(remoteCategoryRepository.watchCategories())
          .thenAnswer((_) => Stream.value(AsyncData(finalData)));
      expect(
        remoteCategoryRepository.watchCategories(),
        emits(isA<AsyncData<List<TodoCategory>>>()),
      );
      verify(remoteCategoryRepository.watchCategories()).called(1);
      remoteCategoryRepository.watchCategories().listen((event) {
        expect(event.value, contains(finalData.first));
      });
    });
    test('Failure', () async {
      when(remoteCategoryRepository.watchCategories())
          .thenAnswer((_) => Stream.value(AsyncError(Exception())));
      remoteCategoryRepository.watchCategories().listen((event) {
        expect(event, isA<AsyncError>());
      });
      verify(remoteCategoryRepository.watchCategories()).called(1);
    });
  });

  group('watchTasksByCategoryId -', () {
    final time = DateTime.now();
    const categoryId = 'id';

    final finalData = [
      TodoTask(
        id: 'taskId',
        title: 'title',
        userId: 'userId',
        categoryId: categoryId,
        createdAt: time,
        dateTime: time.add(const Duration(days: 1)),
      ),
    ];
    test('Success', () async {
      when(remoteCategoryRepository.watchTasksByCategoryId(categoryId))
          .thenAnswer((_) => Stream.value(AsyncData(finalData)));
      expect(
        remoteCategoryRepository.watchTasksByCategoryId(categoryId),
        emits(isA<AsyncData<List<TodoTask>>>()),
      );
      verify(remoteCategoryRepository.watchTasksByCategoryId(categoryId))
          .called(1);

      remoteCategoryRepository.watchTasksByCategoryId(categoryId).listen(
        (event) {
          expect(event.value, contains(finalData.first));
        },
      );
    });
    test('Failure', () async {
      when(remoteCategoryRepository.watchTasksByCategoryId(categoryId))
          .thenAnswer((_) => Stream.value(AsyncError(Exception())));

      remoteCategoryRepository.watchTasksByCategoryId(categoryId).listen(
        (event) {
          expect(event, isA<AsyncError>());
        },
      );

      verify(remoteCategoryRepository.watchTasksByCategoryId(categoryId))
          .called(1);
    });
  });
}
