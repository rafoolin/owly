import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/category_service.dart';
import '../domain/todo_category.dart';

class CategoryStateNotifier extends StateNotifier<AsyncValue<TodoCategory>> {
  final CategoryService _categoryService;
  final String categoryId;
  CategoryStateNotifier(this._categoryService, this.categoryId)
      : super(const AsyncLoading()) {
    subscribeCategory();
  }

  StreamSubscription<AsyncValue<TodoCategory>>? _sub;

  void subscribeCategory() {
    _sub?.cancel();
    _sub = _categoryService
        .subscribeCategory(categoryId)
        .listen((category) => state = category);
  }

  Future<void> deleteCategoryDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('This action can\'t be undo!'),
          actions: [
            SimpleDialogOption(
              child: const Text('Yes'),
              onPressed: () async {
                await _categoryService.deleteCategory(categoryId);
                Navigator.of(context)
                  ..pop()
                  ..pop();
              },
            ),
            SimpleDialogOption(
              child: const Text('No'),
              onPressed: Navigator.of(context).pop,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
