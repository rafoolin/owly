import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/todo_sub_task.dart';

part 'add_task.freezed.dart';

@freezed
class AddTask with _$AddTask {
  factory AddTask({
    String? title,
    String? initialCategoryId,
    String? categoryId,
    DateTime? dueDatetime,
    String? note,
    @Default([]) List<TodoSubTask> subTasks,
  }) = _AddTask;

  AddTask._();

  bool get changed =>
      title != null ||
      categoryId != null ||
      dueDatetime != null ||
      subTasks.isNotEmpty;

  bool get canCreateTask =>
      (title != null && title!.isNotEmpty) &&
      (categoryId != null || initialCategoryId != null) &&
      (dueDatetime != null);
}
