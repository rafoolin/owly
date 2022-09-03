// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TodoSubTaskToJson(TodoSubTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'taskId': instance.taskId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'dueAt': _$JsonConverterToJson<String, TimeOfDay>(
          instance.dueAt, const TimeZConverter().toJson),
      'note': instance.note,
      'indexValue': instance.indexValue,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'completed': instance.completed,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$_TodoSubTask _$$_TodoSubTaskFromJson(Map<String, dynamic> json) =>
    _$_TodoSubTask(
      id: json['id'] as String,
      title: json['title'] as String,
      taskId: json['taskId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      dueAt: _$JsonConverterFromJson<String, TimeOfDay>(
          json['dueAt'], const TimeZConverter().fromJson),
      note: json['note'] as String?,
      indexValue: json['indexValue'] as int?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoSubTaskToJson(_$_TodoSubTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'taskId': instance.taskId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'dueAt': _$JsonConverterToJson<String, TimeOfDay>(
          instance.dueAt, const TimeZConverter().toJson),
      'note': instance.note,
      'indexValue': instance.indexValue,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'completed': instance.completed,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
