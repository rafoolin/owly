import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/controllers/common_providers.dart';
import '../../../../../common/widgets/app_padding.dart';
import '../../../presentation/overview_providers.dart';
import '../../domain/weekly_tasks.dart';

class WeeklyTaskPage extends HookConsumerWidget {
  final DateTime dateTime;
  final VoidCallback? onLeftArrowPressed;
  final VoidCallback? onDateTimePressed;
  final VoidCallback? onRightArrowPressed;
  const WeeklyTaskPage({
    Key? key,
    required this.dateTime,
    this.onLeftArrowPressed,
    this.onDateTimePressed,
    this.onRightArrowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weeklyTasksProvider(dateTime));
    final weeklyTasks = state.value ?? [];

    return ListView(
      children: [
        AppPadding.vertical(),
        _ArrowDatePicker(
          from: dateTime,
          onDateTimePressed: onDateTimePressed,
          onLeftArrowPressed: onLeftArrowPressed,
          onRightArrowPressed: onRightArrowPressed,
        ),
        AppPadding.vertical(),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemCount: weeklyTasks.length,
          itemBuilder: (context, index) {
            return _WeekdayCard(index: index, weeklyTask: weeklyTasks[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ],
    );
  }
}

class _ArrowDatePicker extends HookConsumerWidget {
  final DateTime from;
  final VoidCallback? onLeftArrowPressed;
  final VoidCallback? onDateTimePressed;
  final VoidCallback? onRightArrowPressed;
  const _ArrowDatePicker({
    Key? key,
    required this.from,
    this.onDateTimePressed,
    this.onLeftArrowPressed,
    this.onRightArrowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final df = ref.watch(abrMonthDayFormatProvider);
    final to = from.add(const Duration(days: 6));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        IconButton(
          onPressed: onLeftArrowPressed,
          icon: const Icon(FontAwesomeIcons.angleLeft),
        ),
        Expanded(
          flex: 4,
          child: TextButton(
            onPressed: onDateTimePressed,
            child: Text('${df.format(from)} - ${df.format(to)}'),
          ),
        ),
        IconButton(
          onPressed: onRightArrowPressed,
          icon: const Icon(FontAwesomeIcons.angleRight),
        ),
        const Spacer(),
      ],
    );
  }
}

class _WeekdayCard extends HookConsumerWidget {
  final int index;
  final WeeklyTasks weeklyTask;
  const _WeekdayCard({
    Key? key,
    required this.index,
    required this.weeklyTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final df = ref.watch(abrMonthDayFormatProvider);
    final date = weeklyTask.dateTime;
    final tasks = weeklyTask.tasks;
    final categoriesMap = weeklyTask.tasksByCategory;
    const border = BorderSide(color: Colors.black87, width: 1);
    final row = index ~/ 3;
    final column = index % 3;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: row == 0 ? border : BorderSide.none,
          right: border,
          left: column == 0 ? border : BorderSide.none,
          bottom: border,
        ),
      ),
      child: Column(
        children: [
          AppPadding.vertical(),
          Text(df.format(date)),
          AppPadding.vertical(),
          if (tasks.isEmpty)
            const SizedBox()
          else if (tasks.length > 6)
            Wrap(
              children: categoriesMap.keys.map(
                (id) {
                  final categoryTasks = categoriesMap[id]!;
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      child: Center(child: Text('${categoryTasks.length}')),
                      radius: 12,
                      backgroundColor: categoryTasks.first.categoryColor,
                    ),
                  );
                },
              ).toList(),
            )
          else if (tasks.length <= 6)
            Wrap(
              children: tasks
                  .map(
                    (task) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: task.categoryColor,
                      ),
                    ),
                  )
                  .toList(),
            )
          else if (categoriesMap.keys.length > 6)
            const Text(
              'Too many thing for today!',
              textAlign: TextAlign.center,
            )
          else
            const SizedBox()
        ],
      ),
    );
  }
}
