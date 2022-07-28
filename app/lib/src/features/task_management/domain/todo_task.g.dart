// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'todo_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TodoTaskToJson(TodoTask instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt.toIso8601String(),
      'dueDatetime': instance.dueDatetime.toIso8601String(),
      'completed': instance.completed,
      'note': instance.note,
      'indexValue': instance.indexValue,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'categoryColor': _$JsonConverterToJson<int, Color>(
          instance.categoryColor, const ColorConverter().toJson),
      'completedAt': instance.completedAt?.toIso8601String(),
      'sub_tasks': instance.subTasks,
      'done': instance.done,
      'todo': instance.todo,
      'todoOverAllStr': instance.todoOverAllStr,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$_TodoTask _$$_TodoTaskFromJson(Map<String, dynamic> json) => _$_TodoTask(
      id: json['id'] as String,
      title: json['title'] as String,
      userId: json['userId'] as String,
      categoryId: json['categoryId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      dueDatetime: DateTime.parse(json['dueDatetime'] as String),
      completed: json['completed'] as bool? ?? false,
      note: json['note'] as String?,
      indexValue: json['indexValue'] as int?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      categoryColor: _$JsonConverterFromJson<int, Color>(
          json['categoryColor'], const ColorConverter().fromJson),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      subTasks: (json['sub_tasks'] as List<dynamic>?)
              ?.map((e) => TodoSubTask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TodoTaskToJson(_$_TodoTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt.toIso8601String(),
      'dueDatetime': instance.dueDatetime.toIso8601String(),
      'completed': instance.completed,
      'note': instance.note,
      'indexValue': instance.indexValue,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'categoryColor': _$JsonConverterToJson<int, Color>(
          instance.categoryColor, const ColorConverter().toJson),
      'completedAt': instance.completedAt?.toIso8601String(),
      'sub_tasks': instance.subTasks,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
