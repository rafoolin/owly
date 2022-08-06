import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote_all_categories_repository.dart';
import '../domain/todo_category.dart';

class AllCategoriesService {
  final RemoteAllCategoriesRepository _remoteAllCategoriesRepository;
  AllCategoriesService(this._remoteAllCategoriesRepository);

  Stream<AsyncValue<List<TodoCategory>>> subscribeCategories() {
    return _remoteAllCategoriesRepository.subscribeCategories();
  }

  Future<void> addCategory({required String name, required Color color}) async {
    return _remoteAllCategoriesRepository.addCategory(name: name, color: color);
  }
}
