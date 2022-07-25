import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/converters.dart';

part 'task_category.freezed.dart';
part 'task_category.g.dart';

@freezed
@JsonSerializable(converters: [ColorConverter()], createFactory: false)
class TaskCategory with _$TaskCategory {
  factory TaskCategory({
    required String id,
    required String name,
    required String userId,
    @ColorConverter() Color? color,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _TaskCategory;

  TaskCategory._();

  @override
  factory TaskCategory.fromJson(Map<String, dynamic> json) =>
      _$TaskCategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaskCategoryToJson(this);
}
