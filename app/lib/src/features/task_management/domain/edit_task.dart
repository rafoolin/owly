import 'package:freezed_annotation/freezed_annotation.dart';

import 'todo_category.dart';
import 'todo_sub_task.dart';
import 'todo_task.dart';

part 'edit_task.freezed.dart';

@freezed
class EditTask with _$EditTask {
  factory EditTask({
    TodoTask? initialTask,
    String? title,
    String? categoryId,
    DateTime? dueDatetime,
    String? note,
    List<TodoSubTask>? subTasks,
    @Default([]) List<TodoCategory>? categories,
  }) = _EditTask;

  EditTask._();

  TodoTask? get editedVersion => initialTask == null
      ? null
      : initialTask!.copyWith(
          categoryId: categoryId ?? initialTask!.categoryId,
          dueDatetime: dueDatetime ?? initialTask!.dueDatetime,
          note: note ?? initialTask!.note,
          subTasks: [...(subTasks ?? []), ...initialTask?.subTasks ?? []]
            ..toSet().toList(),
          title: title ?? initialTask!.title,
        );

  bool get changed =>
      (title != null && title != initialTask?.title) ||
      (dueDatetime != null && dueDatetime != initialTask?.dueDatetime) ||
      (note != null && note != initialTask?.note) ||
      (subTasks != null && subTasks != initialTask?.subTasks) ||
      (categoryId != null && categoryId != initialTask?.categoryId);
}
