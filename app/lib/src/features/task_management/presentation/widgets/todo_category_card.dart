import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/app_padding.dart';
import '../../domain/todo_category.dart';
import '../task_view.dart';

class TodoCategoryCard extends StatelessWidget {
  final TodoCategory category;
  const TodoCategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () =>
          context.push(TasksView.fullPath.replaceFirst(':id', category.id)),
      child: Card(
        color: category.color,
        child: Column(
          children: [
            AppPadding.vertical(),
            Text(
              category.name,
              style: textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
