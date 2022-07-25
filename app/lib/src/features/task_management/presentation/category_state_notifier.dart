import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/category_service.dart';
import '../domain/task_category.dart';

class CategoryStateNotifier
    extends StateNotifier<AsyncValue<List<TaskCategory>>> {
  final CategoryService _categoryService;
  CategoryStateNotifier(this._categoryService) : super(const AsyncLoading()) {
    watchCategories();
  }

  StreamSubscription<AsyncValue<List<TaskCategory>>>? sub;

  void watchCategories() {
    sub = _categoryService
        .watchCategories()
        .listen((categories) => state = categories);
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }
}
