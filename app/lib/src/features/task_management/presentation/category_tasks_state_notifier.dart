import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/category_service.dart';
import '../domain/todo_task.dart';

class CategoryTasksStateNotifier
    extends StateNotifier<AsyncValue<List<TodoTask>>> {
  final CategoryService _categoryService;
  final String categoryId;
  CategoryTasksStateNotifier(this._categoryService, this.categoryId)
      : super(const AsyncLoading()) {
    watchTasks();
  }

  StreamSubscription<AsyncValue<List<TodoTask>>>? sub;

  void watchTasks() {
    sub = _categoryService
        .watchTasksByCategoryId(categoryId)
        .listen((tasks) => state = tasks);
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }
}
