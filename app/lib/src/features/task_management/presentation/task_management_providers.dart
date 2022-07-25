import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../client/presentation/client_providers.dart';
import '../application/category_service.dart';
import '../data/remote_category_repository.dart';
import '../domain/task_category.dart';
import 'category_state_notifier.dart';

final remoteCategoryRepositoryProvider =
    Provider<RemoteCategoryRepository>((ref) {
  final gqlClient = ref.watch(graphQLClientProvider);
  return RemoteCategoryRepository(gqlClient);
});

final categoryServiceProvider = Provider.autoDispose<CategoryService>((ref) {
  final remoteCategoryRepo = ref.watch(remoteCategoryRepositoryProvider);
  return CategoryService(remoteCategoryRepo);
});

final categoriesStateNotifierProvider = StateNotifierProvider.autoDispose<
    CategoryStateNotifier, AsyncValue<List<TaskCategory>>>(
  (ref) {
    final categoryService = ref.watch(categoryServiceProvider);
    return CategoryStateNotifier(categoryService);
  },
);
