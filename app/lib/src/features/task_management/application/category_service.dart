import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote_category_repository.dart';
import '../domain/todo_sub_task.dart';
import '../domain/todo_task.dart';

// TODO:: Support offline graphql
class CategoryService {
  final RemoteCategoryRepository _remoteCategoryRepository;
  CategoryService(this._remoteCategoryRepository);

  Stream<AsyncValue<List<TodoTask>>> subscribeTasks(String categoryId) {
    return _remoteCategoryRepository.subscribeTasks(categoryId);
  }

  Future<void> addTask({
    required String title,
    required String categoryId,
    required DateTime dueDatetime,
    String? note,
    List<TodoSubTask> subTasks = const [],
  }) async {
    return _remoteCategoryRepository.addTask(
      categoryId: categoryId,
      dueDatetime: dueDatetime,
      title: title,
      note: note,
      subTasks: subTasks,
    );
  }

  Future<void> addCategory({required String name, required Color color}) async {
    return _remoteCategoryRepository.addCategory(name: name, color: color);
  }

  Future<void> editCategory({
    required String name,
    required Color color,
  }) async {
    return _remoteCategoryRepository.editCategory(name: name, color: color);
  }

  Future<void> deleteCategory(String id) async {
    return _remoteCategoryRepository.deleteCategory(id);
  }
}
