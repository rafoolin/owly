import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/task_service.dart';
import '../../domain/todo_sub_task.dart';
import '../../domain/todo_task.dart';
import '../domain/edit_task.dart';

class EditTaskStateNotifier extends StateNotifier<EditTask> {
  final TaskService _taskService;
  EditTaskStateNotifier(this._taskService) : super(EditTask()) {
    watchTask();
  }
  StreamSubscription<AsyncValue<TodoTask>>? _subTask;

  void watchTask() {
    _subTask?.cancel();
    _subTask = _taskService
        .watchTask()
        .listen((task) => state = state.copyWith(initialTask: task.value));
  }

  void changeTitle(String title) {
    state = state.copyWith(title: title.trim());
  }

  void changeCategory(String categoryId) {
    state = state.copyWith(categoryId: categoryId);
  }

  void changeDueDatetime(DateTime dueDatetime) {
    state = state.copyWith(dueDatetime: dueDatetime);
  }

  void changeNote(String note) {
    state = state.copyWith(note: note);
  }

  void addSubtask(String title) {
    state = state.copyWith(addedSubTasks: [
      ...state.addedSubTasks,
      TodoSubTask.fromTitle(title: title.trim(), taskId: state.initialTask!.id)
    ]);
  }

  void removeSubtask(TodoSubTask subTask) {
    state = state.copyWith(
      removedSubTasks: [...state.removedSubTasks, subTask],
      addedSubTasks: [...state.addedSubTasks]..remove(subTask),
    );
  }

  Future<void> editTask() async {
    await _taskService.editTask(
      title: state.title,
      categoryId: state.categoryId,
      dueDatetime: state.dueDatetime,
      note: state.note,
      addedSubTasks: state.addedSubTasks,
      removedSubTasks: state.removedSubTasks,
    );
  }

  Future<bool> discardDialog(BuildContext context) async {
    if (!state.changed) {
      Navigator.of(context).pop();
      return true;
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('This action can\'t be undo!'),
          actions: [
            SimpleDialogOption(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context)
                  ..pop()
                  ..pop(true);
              },
            ),
            SimpleDialogOption(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  Future<void> showCalendar(BuildContext context) async {
    final now = DateTime.now().toLocal();
    final initialDate = state.editedVersion?.dueDatetime.toLocal() ?? now;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate.add(const Duration(minutes: 1)),
      lastDate: initialDate.add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (pickedTime != null) {
        final finalDateTime = pickedDate.add(
          Duration(
            hours: pickedTime.hour,
            minutes: pickedTime.minute,
          ),
        );

        state = state.copyWith(dueDatetime: finalDateTime);
      }
    }
  }

  @override
  void dispose() {
    _subTask?.cancel();
    super.dispose();
  }
}
