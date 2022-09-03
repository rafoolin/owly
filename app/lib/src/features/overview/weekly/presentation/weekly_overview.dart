import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loop_page_view/loop_page_view.dart';

import '../../../../common/controllers/common_providers.dart';
import '../../../task_management/add_task/presentation/add_task_view.dart';
import '../../presentation/overview_providers.dart';
import 'widgets/weekly_tasks_page.dart';

class WeeklyOverView extends HookConsumerWidget {
  static const path = '/overview/weekly';

  const WeeklyOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final midnight = ref.watch(midnightDateProvider(null));
    final dateTime = useState(midnight);
    final controller = ref.watch(weeklyPageControllerProvider);
    final df = ref.watch(dashedDateFormatProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.plus),
        onPressed: () => context.push(
          AddTaskView.dateTimePath.replaceFirst(
            ':date',
            df.format(dateTime.value),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Weekly'),
        actions: [
          IconButton(
            onPressed: () {
              dateTime.value = midnight;
            },
            icon: const Icon(FontAwesomeIcons.calendarDay),
          )
        ],
      ),
      body: LoopPageView.builder(
        itemCount: 365,
        controller: controller,
        onPageChanged: (page) {
          final swipingRight = page > controller.page;
          if (swipingRight) {
            dateTime.value = dateTime.value.add(const Duration(days: 7));
          } else {
            dateTime.value = dateTime.value.subtract(const Duration(days: 7));
          }
        },
        itemBuilder: (context, index) {
          return WeeklyTaskPage(
            onDateTimePressed: () async {
              final initialDate = dateTime.value;
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime(DateTime.now().year - 10),
                lastDate: DateTime(DateTime.now().year + 10),
              );
              if (pickedDate != null) {
                dateTime.value = pickedDate;
              }
            },
            onLeftArrowPressed: () {
              dateTime.value = dateTime.value.subtract(const Duration(days: 7));
            },
            onRightArrowPressed: () {
              dateTime.value = dateTime.value.add(const Duration(days: 7));
            },
            dateTime: dateTime.value,
          );
        },
      ),
    );
  }
}
