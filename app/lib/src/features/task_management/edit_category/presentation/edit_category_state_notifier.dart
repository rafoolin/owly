import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/category_service.dart';
import '../../domain/todo_category.dart';
import '../domain/edit_category.dart';

class EditCategoryStateNotifier extends StateNotifier<EditCategory> {
  final CategoryService _categoryService;
  final String id;
  EditCategoryStateNotifier(this._categoryService, this.id)
      : super(EditCategory()) {
    _subscribeCategory();
  }

  StreamSubscription<AsyncValue<TodoCategory>>? _sub;

  void _subscribeCategory() {
    _sub?.cancel();
    _sub = _categoryService
        .subscribeCategory(id)
        .listen((category) => state = state.copyWith(initial: category.value));
  }

  void changeName(String name) {
    state = state.copyWith(name: name.trim());
  }

  Future<void> editCategory() async {
    if (!state.canSaveChanges) return;
    await _categoryService.editCategory(
      id: id,
      name: state.name ?? state.initial!.name,
      color: state.color ?? state.initial!.color,
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
              pickerColor: state.color ?? state.initial?.color ?? Colors.white,
              onColorChanged: (color) {
                state = state.copyWith(color: color);
              },
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
  }
}
