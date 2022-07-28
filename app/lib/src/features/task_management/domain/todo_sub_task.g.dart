// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'todo_sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TodoSubTaskToJson(TodoSubTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
      'taskId': instance.taskId,
      'createdAt': instance.createdAt.toIso8601String(),
      'dueAt': const TimeZConverter().toJson(instance.dueAt),
      'completed': instance.completed,
      'note': instance.note,
      'indexValue': instance.indexValue,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_TodoSubTask _$$_TodoSubTaskFromJson(Map<String, dynamic> json) =>
    _$_TodoSubTask(
      id: json['id'] as String,
      title: json['title'] as String,
      userId: json['userId'] as String,
      taskId: json['taskId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      dueAt: const TimeZConverter().fromJson(json['dueAt'] as String),
      completed: json['completed'] as bool? ?? false,
      note: json['note'] as String?,
      indexValue: json['indexValue'] as int?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_TodoSubTaskToJson(_$_TodoSubTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
      'taskId': instance.taskId,
      'createdAt': instance.createdAt.toIso8601String(),
      'dueAt': const TimeZConverter().toJson(instance.dueAt),
      'completed': instance.completed,
      'note': instance.note,
      'indexValue': instance.indexValue,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
