import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/converters.dart';

part 'todo_category.freezed.dart';
part 'todo_category.g.dart';

@freezed
@JsonSerializable(converters: [ColorConverter()], createFactory: false)
class TodoCategory with _$TodoCategory {
  factory TodoCategory({
    required String id,
    required String name,
    required String userId,
    @ColorConverter() Color? color,
    required DateTime createdAt,
    required int totalTasks,
    DateTime? updatedAt,
  }) = _TodoCategory;

  TodoCategory._();

  @override
  factory TodoCategory.fromJson(Map<String, dynamic> json) =>
      _$TodoCategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodoCategoryToJson(this);
}
