import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../client/presentation/client_providers.dart';
import '../../add_category/domain/add_category.dart';
import '../../add_category/presentation/add_category_state_notifier.dart';
import '../../add_task/domain/add_task.dart';
import '../../add_task/presentation/add_task_state_notifier.dart';
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

final _allCategoriesServiceProvider =
    Provider.autoDispose<AllCategoriesService>((ref) {
  final repo = ref.watch(_remoteAllCategoriesRepositoryProvider);
  return AllCategoriesService(repo);
});

final allCategoriesProvider =
    StreamProvider.autoDispose<List<TodoCategory>>((ref) {
  final repo = ref.watch(_allCategoriesServiceProvider);
  return repo.subscribeCategories().map((event) => event.value ?? []);
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

  return EditTaskStateNotifier(taskService);
});

final addTaskStateNotifierProvider =
    StateNotifierProvider.autoDispose<AddTaskStateNotifier, AddTask>((ref) {
  final taskService = ref.watch(categoryServiceProvider);
  return AddTaskStateNotifier(taskService);
});

final addCategoryStateNotifierProvider =
    StateNotifierProvider.autoDispose<AddCategoryStateNotifier, AddCategory>(
  (ref) {
    final categoryService = ref.watch(categoryServiceProvider);
    return AddCategoryStateNotifier(categoryService);
  },
);
