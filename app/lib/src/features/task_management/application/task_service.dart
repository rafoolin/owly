import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote_task_repository.dart';
import '../domain/todo_sub_task.dart';
import '../domain/todo_task.dart';

class TaskService {
  final RemoteTaskRepository _remoteTaskRepository;
  TaskService(this._remoteTaskRepository);

  Stream<AsyncValue<TodoTask>> watchTask(String taskId) {
    return _remoteTaskRepository.watchTask(taskId);
  }

  Stream<AsyncValue<TodoTask>> subscribeTask(String taskId) {
    return _remoteTaskRepository.subscribeTask(taskId);
  }

  Future<void> markTaskAsDone(String taskId, {bool completed = false}) async {
    return _remoteTaskRepository.markTaskAsDone(taskId, completed: completed);
  }

  Future<void> updateSubTaskStatus(String id, {bool completed = false}) async {
    return _remoteTaskRepository.updateSubTaskStatus(id, completed: completed);
  }

  Future<void> addTask({
    required String title,
    required String categoryId,
    required DateTime dueDatetime,
    String? note,
    List<TodoSubTask> subTasks = const [],
  }) async {
    return _remoteTaskRepository.addTask(
      categoryId: categoryId,
      dueDatetime: dueDatetime,
      title: title,
      note: note,
      subTasks: subTasks,
    );
  }

  Future<void> editTask(
    String taskId, {
    String? title,
    String? categoryId,
    DateTime? dueDatetime,
    String? note,
    List<TodoSubTask> addedSubTasks = const [],
    List<TodoSubTask> removedSubTasks = const [],
  }) async {
    return _remoteTaskRepository.editTask(
      taskId,
      categoryId: categoryId,
      dueDatetime: dueDatetime,
      title: title,
      note: note,
      addedSubTasks: addedSubTasks,
      removedSubTasks: removedSubTasks,
    );
  }

  Future<void> deleteTask(String taskId) async {
    return _remoteTaskRepository.deleteTask(taskId);
  }
}
