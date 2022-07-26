import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'category_view.dart';
import 'task_management_providers.dart';

class TasksView extends HookConsumerWidget {
  static const path = 'TasksView/:id';
  static const fullPath = '${CategoryView.path}/TasksView/:id';

  final String categoryId;
  const TasksView({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(categoryTasksStateNotifierProvider(categoryId));

    return Scaffold(
      appBar: AppBar(title: const Text('tasks')),
      body: tasks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => const Center(child: Text('Oh No!')),
        data: (tasks) => ListView.separated(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            final task = tasks[index];
            return ListTile(
              title: Text(
                task.title,
                style: task.completed
                    ? Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(decoration: TextDecoration.lineThrough)
                    : null,
              ),
              trailing: task.completed
                  ? const Icon(FontAwesomeIcons.check)
                  : const Icon(FontAwesomeIcons.square),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
