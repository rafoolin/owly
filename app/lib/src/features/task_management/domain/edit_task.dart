import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default([]) List<TodoSubTask> addedSubTasks,
    @Default([]) List<TodoSubTask> removedSubTasks,
  }) = _EditTask;

  EditTask._();

  TodoTask? get editedVersion => initialTask == null
      ? null
      : initialTask!.copyWith(
          categoryId: categoryId ?? initialTask!.categoryId,
          dueDatetime: dueDatetime ?? initialTask!.dueDatetime,
          note: note ?? initialTask!.note,
          subTasks: [
            for (TodoSubTask subTask in [
              ...addedSubTasks,
              ...initialTask?.subTasks ?? const []
            ])
              if (!removedSubTasks.contains(subTask)) subTask
          ],
          title: title ?? initialTask!.title,
        );

  bool get changed =>
      (title != null && title != initialTask?.title) ||
      (dueDatetime != null && dueDatetime != initialTask?.dueDatetime) ||
      (note != null && note != initialTask?.note) ||
      (addedSubTasks.isNotEmpty || removedSubTasks.isNotEmpty) ||
      (categoryId != null && categoryId != initialTask?.categoryId);
}
