import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/app_padding.dart';
import '../../domain/todo_category.dart';
import '../category_view.dart';

class TodoCategoryCard extends HookConsumerWidget {
  final TodoCategory category;
  const TodoCategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final onEditMode = useState(false);

    return GestureDetector(
      onLongPress: () {
        onEditMode.value = true;
      },
      onTap: () {
        if (onEditMode.value) {
          onEditMode.value = false;
          return;
        }
        context.push(
          CategoryView.path.replaceFirst(
            ':id',
            category.id,
          ),
        );
      },
      child: Card(
        color: category.color,
        child: Column(
          children: [
            AppPadding.vertical(),
            Text(
              category.name,
              style: textTheme.bodyLarge,
            ),
            const Spacer(),
            if (category.totalTasks > 0) ...[
              Text(
                '${category.totalTasks} Task' +
                    (category.totalTasks > 1 ? 's' : ''),
                style: textTheme.bodySmall,
              ),
              AppPadding.vertical(),
            ]
          ],
        ),
      ),
    );
  }
}
