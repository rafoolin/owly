import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'task_management_providers.dart';
import 'widgets/task_category_card.dart';

class CategoryView extends HookConsumerWidget {
  static const path = '/CategoryView';
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('categories')),
      body: categories.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => const Center(child: Text('Oh No!')),
        data: (categories) => GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) => TaskCategoryCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
