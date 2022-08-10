import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_category.freezed.dart';

@freezed
class AddCategory with _$AddCategory {
  factory AddCategory({
    String? name,
    Color? color,
  }) = _AddCategory;

  AddCategory._();

  bool get changed => name != null || color != null;

  bool get canCreateCategory => name != null && name!.isNotEmpty;
}
