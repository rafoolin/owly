import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote_category_repository.dart';
import '../domain/todo_category.dart';
import '../domain/todo_task.dart';

// TODO:: Support offline graphql
class CategoryService {
  final RemoteCategoryRepository _remoteCategoryRepository;
  CategoryService(this._remoteCategoryRepository);

  Stream<AsyncValue<List<TodoCategory>>> subscribeCategories() {
    return _remoteCategoryRepository.subscribeCategories();
  }

  Stream<AsyncValue<List<TodoTask>>> subscribeTasks(String categoryId) {
    return _remoteCategoryRepository.subscribeTasks(categoryId);
  }

  Stream<AsyncValue<TodoCategory>> subscribeCategory(String categoryId) {
    return _remoteCategoryRepository.subscribeCategory(categoryId);
  }

  Future<void> addCategory({required String name, required Color color}) async {
    return _remoteCategoryRepository.addCategory(name: name, color: color);
  }

  Future<void> editCategory({
    required String id,
    required String name,
    Color? color,
  }) async {
    return _remoteCategoryRepository.editCategory(
      id: id,
      name: name,
      color: color,
    );
  }

  Future<void> deleteCategory(String id) async {
    return _remoteCategoryRepository.deleteCategory(id);
  }
}
