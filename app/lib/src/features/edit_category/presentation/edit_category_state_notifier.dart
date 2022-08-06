import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/application/category_service.dart';
import '../domain/edit_category.dart';

class EditCategoryStateNotifier extends StateNotifier<EditCategory> {
  final CategoryService _categoryService;
  EditCategoryStateNotifier(this._categoryService) : super(EditCategory());

  void changeName(String name) {
    state = state.copyWith(name: name.trim());
  }

  Future<void> editCategory() async {
    if (!state.changed) return;
    await _categoryService.editCategory(
      name: state.name!,
      color: state.color ?? Colors.transparent,
    );
  }

  Future<bool> discardDialog(BuildContext context) async {
    if (!state.changed) {
      Navigator.of(context).pop();
      return true;
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('This action can\'t be undo!'),
          actions: [
            SimpleDialogOption(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context)
                  ..pop()
                  ..pop(true);
              },
            ),
            SimpleDialogOption(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  Future<void> showColorPicker(BuildContext context) async {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Pick a Color!'),
          children: [
            HueRingPicker(
              pickerColor: state.color ?? Colors.white,
              onColorChanged: (color) {
                state = state.copyWith(color: color);
              },
            )
          ],
        );
      },
    );
  }
}
