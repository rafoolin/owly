import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/app_padding.dart';
import '../../presentation/task_management_providers.dart';
import '../../presentation/widgets/category_section.dart';

class AddTaskView extends HookConsumerWidget {
  static const path = '/addTask';
  static const categoryPath = '/category/:id/addTask';
  static const dateTimePath = '/addTask/:date';

  final String? id;
  final String? date;
  const AddTaskView({Key? key, this.id, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTaskStateNotifierProvider(id));
    final notifier = ref.watch(addTaskStateNotifierProvider(id).notifier);
    final titleCtrl = useTextEditingController();
    final noteCtrl = useTextEditingController();
    final subTaskCtrl = useTextEditingController();
    useListenable(subTaskCtrl);
    final now = DateTime.now().toLocal();
    final passedDate = DateTime.tryParse(date ?? '')?.add(Duration(
      hours: now.hour,
      minutes: now.minute,
      seconds: now.second,
    ));

    useEffect(() {
      if (passedDate != null) {
        Future.microtask(() => notifier.initialize(dateTime: passedDate));
      }
      return;
    }, [passedDate]);

    return WillPopScope(
      onWillPop: () async => notifier.discardDialog(context),
      child: Scaffold(
        appBar: AppBar(title: const Text('Add New Task')),
        body: ListView(
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
            CategorySection(
              selectedCategoryId: state.categoryId ?? state.initialCategoryId,
              chosenDueDatetime: state.dueDatetime ?? passedDate,
              onCategoryChanged: id != null ? null : notifier.changeCategory,
              onCalenderPressed: () =>
                  notifier.showCalendar(context, init: passedDate),
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
            ...state.subTasks.map(
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
                  onPressed: state.canCreateTask
                      ? () async {
                          await notifier.addTask();
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
