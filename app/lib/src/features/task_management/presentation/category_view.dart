import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_padding.dart';
import '../../add_task/presentation/add_task_view.dart';
import '../../home/presentation/widgets/task_card.dart';
import 'task_management_providers.dart';

class CategoryView extends HookConsumerWidget {
  static const path = '/categoryView/:id';
  final String id;
  const CategoryView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(categoryTasksProvider(id)).value ?? [];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.plus),
        onPressed: () =>
            context.push(AddTaskView.categoryPath.replaceFirst(':id', id)),
      ),
      appBar: AppBar(title: const Text('categories')),
      body: ListView.builder(
        padding: AppPadding.topPadding,
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) =>
            TaskCard(task: tasks[index]),
      ),
    );
  }
}
