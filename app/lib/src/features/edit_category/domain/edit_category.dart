import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../task_management/domain/todo_category.dart';

part 'edit_category.freezed.dart';

@freezed
class EditCategory with _$EditCategory {
  factory EditCategory({
    TodoCategory? initial,
    String? name,
    Color? color,
  }) = _EditCategory;

  EditCategory._();

  TodoCategory? get editedCategory => initial == null
      ? null
      : initial!.copyWith(
          name: name ?? initial!.name,
          color: color ?? initial!.color,
        );

  bool get changed =>
      (name != null && name != initial?.name) ||
      (color != null && color != initial?.color);

  bool get canSaveChanges => initial != null && changed;
}
