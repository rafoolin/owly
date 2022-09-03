import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loop_page_view/loop_page_view.dart';

import '../../../../common/controllers/common_providers.dart';
import '../../../task_management/add_task/presentation/add_task_view.dart';
import '../../presentation/overview_providers.dart';
import 'widgets/daily_tasks_page.dart';

class DailyOverView extends HookConsumerWidget {
  static const todayPath = '/overview/daily';
  static const microEpochPath = '/overview/daily/:micro_epoch';

  final int? microEpoch;
  const DailyOverView({Key? key, this.microEpoch}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final midnight = ref.watch(midnightDateProvider(microEpoch));
    final dateTime = useState(midnight);
    final controller = ref.watch(dailyPageControllerProvider);
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
        title: const Text('Daily'),
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
          dateTime.value = midnight.add(Duration(days: page));
        },
        itemBuilder: (context, index) {
          return DailyTaskPage(
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
              dateTime.value = dateTime.value.subtract(const Duration(days: 1));
            },
            onRightArrowPressed: () {
              dateTime.value = dateTime.value.add(const Duration(days: 1));
            },
            dateTime: dateTime.value,
          );
        },
      ),
    );
  }
}
