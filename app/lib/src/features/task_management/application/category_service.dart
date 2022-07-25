import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote_category_repository.dart';
import '../domain/task_category.dart';

// TODO:: Support offline graphql
class CategoryService {
  final RemoteCategoryRepository _remoteCategoryRepository;
  CategoryService(this._remoteCategoryRepository);

  Stream<AsyncValue<List<TaskCategory>>> watchCategories() {
    return _remoteCategoryRepository.watchCategories();
  }
}
