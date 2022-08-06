import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/presentation/task_management_providers.dart';
import '../../task_management/presentation/widgets/todo_category_card.dart';

class CategoriesView extends HookConsumerWidget {
  static const path = '/categoriesView';
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(allCategoriesProvider).value ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) =>
            TodoCategoryCard(category: categories[index]),
      ),
    );
  }
}
