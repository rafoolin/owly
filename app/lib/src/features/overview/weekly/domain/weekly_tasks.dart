import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../task_management/domain/todo_task.dart';

part 'weekly_tasks.freezed.dart';

@freezed
class WeeklyTasks with _$WeeklyTasks {
  factory WeeklyTasks({
    required String date,
    @Default([]) List<TodoTask> tasks,
  }) = _WeeklyTasks;

  WeeklyTasks._();

  DateTime get dateTime => DateTime.parse(date);

  Map<String, List<TodoTask>> get tasksByCategory {
    Map<String, List<TodoTask>> map = {};

    for (var task in tasks) {
      map[task.categoryId] = [...map[task.categoryId] ?? [], task];
    }

    return map;
  }

  int numberOfTasksByCategory(String categoryId) =>
      tasks.where((task) => task.categoryId == categoryId).length;
}
