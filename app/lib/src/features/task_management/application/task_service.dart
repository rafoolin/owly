import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/remote_task_repository.dart';
import '../domain/todo_sub_task.dart';
import '../domain/todo_task.dart';

class TaskService {
  final RemoteTaskRepository _remoteTaskRepository;
  TaskService(this._remoteTaskRepository);

  Stream<AsyncValue<TodoTask>> watchTask() {
    return _remoteTaskRepository.watchTask();
  }

  Stream<AsyncValue<TodoTask>> subscribeTask() {
    return _remoteTaskRepository.subscribeTask();
  }

  Future<void> markTaskAsDone({bool completed = false}) async {
    return _remoteTaskRepository.markTaskAsDone(completed: completed);
  }

  Future<void> updateSubTaskStatus(String id, {bool completed = false}) async {
    return _remoteTaskRepository.updateSubTaskStatus(id, completed: completed);
  }

  Future<void> deleteTask() async {
    return _remoteTaskRepository.deleteTask();
  }

  Future<void> editTask({
    String? title,
    String? categoryId,
    DateTime? dueDatetime,
    String? note,
    List<TodoSubTask> addedSubTasks = const [],
    List<TodoSubTask> removedSubTasks = const [],
  }) async {
    return _remoteTaskRepository.editTask(
      categoryId: categoryId,
      dueDatetime: dueDatetime,
      title: title,
      note: note,
      addedSubTasks: addedSubTasks,
      removedSubTasks: removedSubTasks,
    );
  }
}
