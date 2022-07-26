import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote_category_repository.dart';
import '../domain/todo_category.dart';
import '../domain/todo_task.dart';

// TODO:: Support offline graphql
class CategoryService {
  final RemoteCategoryRepository _remoteCategoryRepository;
  CategoryService(this._remoteCategoryRepository);

  Stream<AsyncValue<List<TodoCategory>>> watchCategories() {
    return _remoteCategoryRepository.watchCategories();
  }

  Stream<AsyncValue<List<TodoTask>>> watchTasksByCategoryId(String categoryId) {
    return _remoteCategoryRepository.watchTasksByCategoryId(categoryId);
  }
}
