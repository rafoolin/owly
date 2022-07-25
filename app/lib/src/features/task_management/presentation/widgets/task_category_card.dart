import 'package:flutter/material.dart';

import '../../../../common/widgets/app_padding.dart';
import '../../domain/task_category.dart';

class TaskCategoryCard extends StatelessWidget {
  final TaskCategory category;
  const TaskCategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
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
    );
  }
}
