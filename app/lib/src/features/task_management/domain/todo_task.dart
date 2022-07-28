import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/converters.dart';
import 'todo_sub_task.dart';

part 'todo_task.freezed.dart';
part 'todo_task.g.dart';

@freezed
@JsonSerializable(converters: [ColorConverter()], createFactory: false)
class TodoTask with _$TodoTask {
  factory TodoTask({
    required String id,
    required String title,
    required String userId,
    required String categoryId,
    required DateTime createdAt,
    required DateTime dueDatetime,
    @Default(false) bool completed,
    String? note,
    int? indexValue,
    DateTime? updatedAt,
    @ColorConverter() Color? categoryColor,
    DateTime? completedAt,
    @JsonKey(name: 'sub_tasks') @Default([]) List<TodoSubTask> subTasks,
  }) = _TodoTask;

  TodoTask._();

  @override
  factory TodoTask.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodoTaskToJson(this);

  int get done => subTasks.where((t) => t.completed).length;
  int get todo => subTasks.length - done;

  String get todoOverAllStr => '$done/${subTasks.length}';
}
