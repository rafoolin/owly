// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TodoCategoryToJson(TodoCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson),
      'createdAt': instance.createdAt.toIso8601String(),
      'totalTasks': instance.totalTasks,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$_TodoCategory _$$_TodoCategoryFromJson(Map<String, dynamic> json) =>
    _$_TodoCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      userId: json['userId'] as String,
      color: _$JsonConverterFromJson<int, Color>(
          json['color'], const ColorConverter().fromJson),
      createdAt: DateTime.parse(json['createdAt'] as String),
      totalTasks: json['totalTasks'] as int,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_TodoCategoryToJson(_$_TodoCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson),
      'createdAt': instance.createdAt.toIso8601String(),
      'totalTasks': instance.totalTasks,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
