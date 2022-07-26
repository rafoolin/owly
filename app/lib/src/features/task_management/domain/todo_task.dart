import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_task.freezed.dart';
part 'todo_task.g.dart';

@freezed
@JsonSerializable(createFactory: false)
class TodoTask with _$TodoTask {
  factory TodoTask({
    required String id,
    required String title,
    required String userId,
    required String categoryId,
    required DateTime createdAt,
    required DateTime dateTime,
    @Default(false) bool completed,
    String? note,
    String? parentId,
    DateTime? updatedAt,
    DateTime? completedAt,
    @Default([]) List<TodoTask> subTasks,
  }) = _TodoTask;

  TodoTask._();

  @override
  factory TodoTask.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodoTaskToJson(this);
}
