import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/screens/error_view.dart';
import '../../../common/widgets/app_padding.dart';
import '../../../common/widgets/expandable_text.dart';
import '../domain/todo_task.dart';
import 'edit_task_view.dart';
import 'task_management_providers.dart';

class TaskView extends HookConsumerWidget {
  static const path = '/TaskView/:id';

  final String taskId;
  const TaskView({Key? key, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskStateNotifierProvider(taskId));
    final stateNotifier = ref.watch(taskStateNotifierProvider(taskId).notifier);
    final isLoading = state is AsyncLoading;

    if (state is AsyncError) {
      return const ErrorView();
    }

    final task = state.value;

    return Scaffold(
      appBar: AppBar(
        title: isLoading ? null : Text(task!.title),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            onSelected: (item) async {
              switch (item) {
                case 0:
                  return context.push(
                    EditTaskView.fullPath.replaceFirst(
                      ':id',
                      taskId,
                    ),
                  );
                case 1:
                  return stateNotifier.deleteTaskDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: 0, child: Text('Edit')),
              const PopupMenuItem(
                value: 1,
                child: Text('Delete'),
                textStyle: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: LinearProgressIndicator())
          : task!.oneSteppedTask
              ? _OneSteppedTask(
                  task: task,
                  toggleTask: stateNotifier.markTaskAsDone,
                )
              : _MultiSteppedTask(
                  task: task,
                  toggleTask: stateNotifier.markTaskAsDone,
                  toggleSubTask: (id, completed) => stateNotifier
                      .updateSubTaskStatus(id, completed: completed),
                ),
    );
  }
}

class _OneSteppedTask extends StatelessWidget {
  final TodoTask task;
  final AsyncCallback? toggleTask;
  const _OneSteppedTask({Key? key, required this.task, this.toggleTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppPadding.padding,
      children: [
        Text(
          'You decided to finish it before'
          ' ${DateFormat.Hm().format(task.dueDatetime)}'
          ' on ${DateFormat.yMd().format(task.dueDatetime)}',
          textAlign: TextAlign.center,
        ),
        TextButton.icon(
          onPressed: toggleTask,
          icon: task.completed
              ? const Icon(FontAwesomeIcons.squareCheck)
              : const Icon(FontAwesomeIcons.square),
          label: task.completed ? const Text('Done') : const Text('Do it!'),
        ),
        AppPadding.vertical(),
        if (task.note != null) ...[
          ExpandableText(text: task.note!),
          AppPadding.vertical(),
        ],
      ],
    );
  }
}

class _MultiSteppedTask extends StatelessWidget {
  final TodoTask task;
  final AsyncCallback? toggleTask;

  final Function(String subTaskId, bool completed)? toggleSubTask;
  const _MultiSteppedTask({
    Key? key,
    required this.task,
    this.toggleSubTask,
    this.toggleTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppPadding.padding,
      children: [
        if (task.completed)
          TextButton.icon(
            onPressed: null,
            icon: const Icon(FontAwesomeIcons.check),
            label: const Text('All done'),
          )
        else
          TextButton.icon(
            onPressed: toggleTask,
            icon: const Icon(FontAwesomeIcons.check),
            label: const Text('Mark as done'),
          ),
        AppPadding.vertical(),
        if (task.note != null) ...[
          ExpandableText(text: task.note!),
          AppPadding.vertical(),
        ],
        for (final subTask in task.subTasks)
          CheckboxListTile(
            key: ValueKey(subTask.id),
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(subTask.title),
            value: subTask.completed,
            onChanged: (value) =>
                toggleSubTask?.call(subTask.id, value ?? false),
            secondary: Text(subTask.dueAt.format(context)),
          ),
      ],
    );
  }
}
