import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/app_padding.dart';
import '../../add_category/presentation/add_category_view.dart';
import '../task_management_providers.dart';

class CategorySection extends HookConsumerWidget {
  final String? selectedCategoryId;
  final DateTime? chosenDueDatetime;
  final void Function(String)? onCategoryChanged;
  final VoidCallback onCalenderPressed;
  const CategorySection({
    Key? key,
    required this.selectedCategoryId,
    required this.chosenDueDatetime,
    required this.onCategoryChanged,
    required this.onCalenderPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(allCategoriesProvider).value ?? [];
    final showSelected = categories.isNotEmpty && selectedCategoryId != null;

    return Container(
      padding: AppPadding.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade200,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Category',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              AppPadding.horizontal(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 0.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButton<String>(
                    elevation: 0,
                    value: showSelected ? selectedCategoryId : null,
                    isExpanded: true,
                    underline: const SizedBox(),
                    borderRadius: BorderRadius.circular(10.0),
                    items: [
                      ...categories
                          .map(
                            (c) => DropdownMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.circle,
                                      color: c.color, size: 18.0),
                                  const SizedBox(width: 4.0),
                                  Text(c.name),
                                ],
                              ),
                              value: c.id,
                            ),
                          )
                          .toList(),
                      DropdownMenuItem(
                        onTap: () {
                          context.push(AddCategoryView.path);
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.add, size: 18.0),
                            SizedBox(width: 4.0),
                            Text('Add New'),
                          ],
                        ),
                        value: 'new',
                      )
                    ],
                    onChanged: onCategoryChanged == null
                        ? null
                        : (value) {
                            if (value != null) {
                              onCategoryChanged?.call(value);
                            }
                          },
                  ),
                ),
              ),
            ],
          ),
          AppPadding.vertical(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Due Date',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              AppPadding.horizontal(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    title: chosenDueDatetime == null
                        ? null
                        : Text(DateFormat.yMMMMd().format(chosenDueDatetime!)),
                    trailing: const Icon(FontAwesomeIcons.calendar),
                    onTap: onCalenderPressed,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
