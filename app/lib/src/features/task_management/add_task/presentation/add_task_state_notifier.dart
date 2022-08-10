import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/task_service.dart';
import '../../domain/todo_sub_task.dart';
import '../domain/add_task.dart';

class AddTaskStateNotifier extends StateNotifier<AddTask> {
  final TaskService _taskService;

  AddTaskStateNotifier(this._taskService, String? _categoryId)
      : super(AddTask(initialCategoryId: _categoryId));

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
    if (title.trim().isEmpty) return;
    state = state.copyWith(
      subTasks: [
        ...state.subTasks,
        TodoSubTask.fromTitle(title: title.trim(), taskId: '')
      ],
    );
  }

  void removeSubtask(TodoSubTask subTask) {
    state = state.copyWith(subTasks: [...state.subTasks]..remove(subTask));
  }

  Future<void> addTask() async {
    if (!state.canCreateTask) return;
    await _taskService.addTask(
      title: state.title!,
      categoryId: state.categoryId ?? state.initialCategoryId!,
      dueDatetime: state.dueDatetime!,
      note: state.note,
      subTasks: state.subTasks,
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
    final initialDate = DateTime.now().toLocal();
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
}
