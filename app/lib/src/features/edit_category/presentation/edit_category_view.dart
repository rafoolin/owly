import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_padding.dart';
import '../../task_management/presentation/task_management_providers.dart';

class EditCategoryView extends HookConsumerWidget {
  static const path = '/editCategory';
  const EditCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addCategoryStateNotifierProvider);
    final notifier = ref.watch(addCategoryStateNotifierProvider.notifier);
    final nameCtrl = useTextEditingController();

    return WillPopScope(
      onWillPop: () async => notifier.discardDialog(context),
      child: Scaffold(
        appBar: AppBar(title: const Text('Add New Category')),
        body: ListView(
          padding: AppPadding.padding,
          children: [
            TextField(
              controller: nameCtrl,
              onChanged: notifier.changeName,
              maxLength: 120,
              autofocus: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.layerGroup,
                  color: Colors.grey,
                ),
                hintText: 'Category Name',
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                counterText: '',
              ),
            ),
            AppPadding.vertical(),
            ListTile(
              leading: const Icon(FontAwesomeIcons.palette, color: Colors.grey),
              title: Text(
                (state.color ?? Colors.transparent)
                    .value
                    .toRadixString(16)
                    .padLeft(8, '0')
                    .toUpperCase(),
              ),
              trailing: CircleAvatar(backgroundColor: state.color),
              onTap: () => notifier.showColorPicker(context),
            ),
            AppPadding.vertical(flex: 2),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: state.canCreateCategory
                      ? () async {
                          await notifier.addCategory();
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () => notifier.discardDialog(context),
                  child: const Text('Discard'),
                ),
              ],
            ),
            AppPadding.vertical(flex: 2),
          ],
        ),
      ),
    );
  }
}
