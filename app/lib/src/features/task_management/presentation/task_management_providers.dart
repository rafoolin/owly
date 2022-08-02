import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../client/presentation/client_providers.dart';
import '../application/all_categories_service.dart';
import '../application/category_service.dart';
import '../application/task_service.dart';
import '../data/remote_all_categories_repository.dart';
import '../data/remote_category_repository.dart';
import '../data/remote_task_repository.dart';
import '../domain/edit_task.dart';
import '../domain/todo_category.dart';
import '../domain/todo_task.dart';
import 'category_state_notifier.dart';
import 'category_tasks_state_notifier.dart';
import 'edit_task_state_notifier.dart';
import 'task_state_notifier.dart';

final _remoteCategoryRepositoryProvider =
    Provider<RemoteCategoryRepository>((ref) {
  final gqlClient = ref.watch(graphQLClientProvider);
  return RemoteCategoryRepository(gqlClient);
});

final _remoteAllCategoriesRepositoryProvider =
    Provider<RemoteAllCategoriesRepository>((ref) {
  final gqlClient = ref.watch(graphQLClientProvider);
  return RemoteAllCategoriesRepository(gqlClient);
});

final categoryServiceProvider = Provider.autoDispose<CategoryService>((ref) {
  final remoteCategoryRepo = ref.watch(_remoteCategoryRepositoryProvider);
  return CategoryService(remoteCategoryRepo);
});

final allCategoriesServiceProvider =
    Provider.autoDispose<AllCategoriesService>((ref) {
  final repo = ref.watch(_remoteAllCategoriesRepositoryProvider);
  return AllCategoriesService(repo);
});

final categoriesStateNotifierProvider = StateNotifierProvider.autoDispose<
    CategoryStateNotifier, AsyncValue<List<TodoCategory>>>(
  (ref) {
    final categoryService = ref.watch(categoryServiceProvider);
    return CategoryStateNotifier(categoryService);
  },
);

final categoryTasksStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<CategoryTasksStateNotifier, AsyncValue<List<TodoTask>>, String>(
  (ref, categoryId) {
    final categoryService = ref.watch(categoryServiceProvider);
    return CategoryTasksStateNotifier(categoryService, categoryId);
  },
);

final _remoteTaskRepositoryProvider =
    Provider.autoDispose.family<RemoteTaskRepository, String>((ref, id) {
  final gqlClient = ref.watch(graphQLClientProvider);
  return RemoteTaskRepository(gqlClient, id);
});

final taskServiceProvider =
    Provider.autoDispose.family<TaskService, String>((ref, id) {
  final remoteTaskRepo = ref.watch(_remoteTaskRepositoryProvider(id));
  return TaskService(remoteTaskRepo);
});

final taskStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<TaskStateNotifier, AsyncValue<TodoTask>, String>((ref, id) {
  final taskService = ref.watch(taskServiceProvider(id));

  return TaskStateNotifier(taskService);
});

final editTaskStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<EditTaskStateNotifier, EditTask, String>((ref, id) {
  final taskService = ref.watch(taskServiceProvider(id));
  final allCategoriesService = ref.watch(allCategoriesServiceProvider);

  return EditTaskStateNotifier(taskService, allCategoriesService);
});
