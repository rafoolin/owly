import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/app_padding.dart';
import '../domain/todo_category.dart';
import 'task_management_providers.dart';
import 'task_view.dart';

class EditTaskView extends HookConsumerWidget {
  static const path = 'editTask';
  static const fullPath = '${TaskView.path}/editTask';

  final String taskId;
  const EditTaskView({Key? key, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editTaskStateNotifierProvider(taskId));
    final notifier = ref.watch(editTaskStateNotifierProvider(taskId).notifier);
    final task = state.editedVersion;
    final initialTask = state.initialTask;
    final isLoading = task == null;
    final titleCtrl = useTextEditingController(text: task?.title);
    final noteCtrl = useTextEditingController(text: task?.note);
    final subTaskCtrl = useTextEditingController();
    useListenable(subTaskCtrl);

    useEffect(() {
      if (initialTask != null) {
        titleCtrl.text = initialTask.title;
      }
      if (initialTask?.note != null) {
        noteCtrl.text = initialTask!.note!;
      }
      return;
    }, [state.initialTask]);

    return WillPopScope(
      onWillPop: () async => notifier.discardDialog(context),
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit')),
        body: isLoading
            ? const Center(child: LinearProgressIndicator())
            : ListView(
                padding: AppPadding.padding,
                children: [
                  TextField(
                    controller: titleCtrl,
                    onChanged: notifier.changeTitle,
                    maxLength: 120,
                    autofocus: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.square,
                        color: Colors.grey,
                      ),
                      hintText: 'Title',
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                  AppPadding.vertical(),
                  _CategorySection(
                    categoryId: task.categoryId,
                    dueDatetime: task.dueDatetime,
                    categories: state.categories ?? [],
                    onCategoryChanged: notifier.changeCategory,
                    onCalenderPressed: () => notifier.showCalendar(context),
                  ),
                  AppPadding.vertical(),
                  Container(
                    padding: AppPadding.padding,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      controller: noteCtrl,
                      onChanged: notifier.changeNote,
                      decoration: const InputDecoration(
                        hintText: 'write some notes...',
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      maxLines: 20,
                      minLines: 5,
                    ),
                  ),
                  AppPadding.vertical(),
                  ...task.subTasks.map(
                    (t) => ListTile(
                      leading: const Icon(FontAwesomeIcons.trash),
                      title: Text(t.title),
                      onTap: () => notifier.removeSubtask(t),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.plus),
                    title: TextField(
                      controller: subTaskCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Add a subtask',
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                    onTap: subTaskCtrl.text.trim().isEmpty
                        ? null
                        : () {
                            notifier.addSubtask(subTaskCtrl.text);
                            subTaskCtrl.clear();
                          },
                  ),
                  AppPadding.vertical(flex: 2),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: state.changed
                            ? () async {
                                await notifier.editTask();
                                Navigator.of(context).pop();
                              }
                            : null,
                        child: const Text('Save'),
                      ),
                      TextButton(
                        onPressed: () => notifier.discardDialog(context),
                        child: const Text('Discard'),
                      ),
                    ],
                  ),
                  AppPadding.vertical(flex: 2),
                ],
              ),
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String categoryId;
  final DateTime dueDatetime;
  final List<TodoCategory> categories;
  final void Function(String) onCategoryChanged;
  final VoidCallback onCalenderPressed;
  const _CategorySection({
    Key? key,
    required this.categoryId,
    required this.dueDatetime,
    required this.categories,
    required this.onCategoryChanged,
    required this.onCalenderPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade200,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Category',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              AppPadding.horizontal(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 0.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButton<String>(
                    elevation: 0,
                    value: categoryId,
                    isExpanded: true,
                    underline: const SizedBox(),
                    borderRadius: BorderRadius.circular(10.0),
                    items: categories
                        .map(
                          (c) => DropdownMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.circle, color: c.color, size: 18.0),
                                const SizedBox(width: 4.0),
                                Text(c.name),
                              ],
                            ),
                            value: c.id,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        onCategoryChanged(value);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          AppPadding.vertical(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Due Date',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              AppPadding.horizontal(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    title: Text(DateFormat.yMMMMd().format(dueDatetime)),
                    trailing: const Icon(FontAwesomeIcons.calendar),
                    onTap: onCalenderPressed,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
