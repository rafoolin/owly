import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/category_service.dart';
import '../domain/todo_category.dart';

class CategoryStateNotifier
    extends StateNotifier<AsyncValue<List<TodoCategory>>> {
  final CategoryService _categoryService;
  CategoryStateNotifier(this._categoryService) : super(const AsyncLoading()) {
    watchCategories();
  }

  StreamSubscription<AsyncValue<List<TodoCategory>>>? sub;

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