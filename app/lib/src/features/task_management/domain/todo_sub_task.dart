import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/converters.dart';

part 'todo_sub_task.freezed.dart';
part 'todo_sub_task.g.dart';

@freezed
@JsonSerializable(converters: [TimeZConverter()], createFactory: false)
class TodoSubTask with _$TodoSubTask {
  factory TodoSubTask({
    required String id,
    required String title,
    required String userId,
    required String taskId,
    required DateTime createdAt,
    @TimeZConverter() required TimeOfDay dueAt,
    @Default(false) bool completed,
    String? note,
    int? indexValue,
    DateTime? updatedAt,
  }) = _TodoSubTask;

  TodoSubTask._();

  @override
  factory TodoSubTask.fromJson(Map<String, dynamic> json) =>
      _$TodoSubTaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodoSubTaskToJson(this);
}
