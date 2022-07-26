import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../client/presentation/client_providers.dart';
import '../application/category_service.dart';
import '../data/remote_category_repository.dart';
import '../domain/todo_category.dart';
import '../domain/todo_task.dart';
import 'category_state_notifier.dart';
import 'category_tasks_state_notifier.dart';

final _remoteCategoryRepositoryProvider =
    Provider<RemoteCategoryRepository>((ref) {
  final gqlClient = ref.watch(graphQLClientProvider);
  return RemoteCategoryRepository(gqlClient);
});

final categoryServiceProvider = Provider.autoDispose<CategoryService>((ref) {
  final remoteCategoryRepo = ref.watch(_remoteCategoryRepositoryProvider);
  return CategoryService(remoteCategoryRepo);
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
