import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../add_category/presentation/add_category_view.dart';
import '../../task_management/presentation/task_management_providers.dart';
import '../../task_management/presentation/widgets/todo_category_card.dart';

class CategoriesView extends HookConsumerWidget {
  static const path = '/categoriesView';
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(allCategoriesProvider).value ?? [];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.plus),
        onPressed: () => context.push(AddCategoryView.path),
      ),
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
