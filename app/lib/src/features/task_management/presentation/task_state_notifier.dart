import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/task_service.dart';
import '../domain/todo_task.dart';

class TaskStateNotifier extends StateNotifier<AsyncValue<TodoTask>> {
  final TaskService _taskService;
  final String taskId;
  TaskStateNotifier(this._taskService, this.taskId)
      : super(const AsyncLoading()) {
    subscribeTask();
  }

  StreamSubscription<AsyncValue<TodoTask>>? _sub;

  void subscribeTask() {
    _sub?.cancel();
    _sub = _taskService.subscribeTask(taskId).listen((task) => state = task);
  }

  Future<void> markTaskAsDone() async {
    await _taskService.markTaskAsDone(taskId,
        completed: !state.value!.completed);
  }

  Future<void> updateSubTaskStatus(String id, {bool completed = false}) async {
    await _taskService.updateSubTaskStatus(id, completed: completed);
  }

  Future<void> deleteTask() async {
    await _taskService.deleteTask(taskId);
  }

  Future<void> deleteTaskDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('This action can\'t be undo!'),
          actions: [
            SimpleDialogOption(
              child: const Text('Yes'),
              onPressed: () async {
                await deleteTask();
                Navigator.of(context)
                  ..pop()
                  ..pop();
              },
            ),
            SimpleDialogOption(
              child: const Text('No'),
              onPressed: Navigator.of(context).pop,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
