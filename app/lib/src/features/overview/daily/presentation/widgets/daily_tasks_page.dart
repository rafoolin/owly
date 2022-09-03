import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/controllers/common_providers.dart';
import '../../../../../common/widgets/app_padding.dart';
import '../../../../home/presentation/widgets/task_card.dart';
import '../../../presentation/overview_providers.dart';

class DailyTaskPage extends HookConsumerWidget {
  final DateTime dateTime;
  final VoidCallback? onLeftArrowPressed;
  final VoidCallback? onDateTimePressed;
  final VoidCallback? onRightArrowPressed;
  const DailyTaskPage({
    Key? key,
    required this.dateTime,
    this.onLeftArrowPressed,
    this.onDateTimePressed,
    this.onRightArrowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dailyTasksNotifierProvider(dateTime));
    final tasks = state.value ?? [];

    if (state is! AsyncLoading && tasks.isEmpty) {
      return Column(
        children: [
          AppPadding.vertical(),
          _ArrowDatePicker(
            dateTime: dateTime,
            onDateTimePressed: onDateTimePressed,
            onLeftArrowPressed: onLeftArrowPressed,
            onRightArrowPressed: onRightArrowPressed,
          ),
          const Expanded(child: Center(child: Text('No Tasks for today!'))),
        ],
      );
    }

    return ListView(
      children: [
        AppPadding.vertical(),
        _ArrowDatePicker(
          dateTime: dateTime,
          onDateTimePressed: onDateTimePressed,
          onLeftArrowPressed: onLeftArrowPressed,
          onRightArrowPressed: onRightArrowPressed,
        ),
        AppPadding.vertical(),
        ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskCard(task: task);
          },
        )
      ],
    );
  }
}

class _ArrowDatePicker extends HookConsumerWidget {
  final DateTime dateTime;
  final VoidCallback? onLeftArrowPressed;
  final VoidCallback? onDateTimePressed;
  final VoidCallback? onRightArrowPressed;
  const _ArrowDatePicker({
    Key? key,
    required this.dateTime,
    this.onDateTimePressed,
    this.onLeftArrowPressed,
    this.onRightArrowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final df = ref.watch(dateFormatProvider);

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
            child: Text(df.format(dateTime)),
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
