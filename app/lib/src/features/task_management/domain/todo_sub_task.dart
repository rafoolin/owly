import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../common/models/converters.dart';

part 'todo_sub_task.freezed.dart';
part 'todo_sub_task.g.dart';

@freezed
@JsonSerializable(converters: [TimeZConverter()], createFactory: false)
class TodoSubTask with _$TodoSubTask {
  factory TodoSubTask({
    required String id,
    required String title,
    required String taskId,
    DateTime? createdAt,
    @TimeZConverter() TimeOfDay? dueAt,
    String? note,
    int? indexValue,
    DateTime? updatedAt,
    DateTime? completedAt,
    @Default(false) bool completed,
  }) = _TodoSubTask;

  TodoSubTask._();

  @override
  factory TodoSubTask.fromJson(Map<String, dynamic> json) =>
      _$TodoSubTaskFromJson(json);

  factory TodoSubTask.fromTitle({
    required String title,
    required String taskId,
  }) =>
      TodoSubTask(
        id: const Uuid().v4(),
        title: title,
        taskId: taskId,
        dueAt: TimeOfDay.now(),
      );

  @override
  Map<String, dynamic> toJson() => _$TodoSubTaskToJson(this);
}
