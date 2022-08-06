import 'package:freezed_annotation/freezed_annotation.dart';

import '../../task_management/domain/todo_category.dart';
import '../../task_management/domain/todo_sub_task.dart';

part 'add_task.freezed.dart';

@freezed
class AddTask with _$AddTask {
  factory AddTask({
    String? title,
    String? categoryId,
    DateTime? dueDatetime,
    String? note,
    @Default([]) List<TodoSubTask> subTasks,
    @Default([]) List<TodoCategory> categories,
  }) = _AddTask;

  AddTask._();

  bool get changed =>
      title != null ||
      categoryId != null ||
      dueDatetime != null ||
      subTasks.isNotEmpty;

  bool get canCreateTask =>
      (title != null && title!.isNotEmpty) &&
      (categoryId != null) &&
      (dueDatetime != null);
}
