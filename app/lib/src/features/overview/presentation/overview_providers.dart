import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loop_page_view/loop_page_view.dart';

import '../../../client/presentation/client_providers.dart';
import '../../task_management/domain/todo_task.dart';
import '../application/overview_service.dart';
import '../daily/presentation/daily_tasks_state_notifier.dart';
import '../data/remote_overview_repository.dart';
import '../weekly/domain/weekly_tasks.dart';

final dailyPageControllerProvider = Provider<LoopPageController>((ref) {
  final controller = LoopPageController();

  ref.onDispose(() => controller.dispose());
  return controller;
});

final weeklyPageControllerProvider = Provider<LoopPageController>((ref) {
  final controller = LoopPageController();

  ref.onDispose(() => controller.dispose());
  return controller;
});

final newYearDateTimeProvider = Provider<DateTime>((_) {
  final now = DateTime.now().toLocal();
  return DateTime(now.year, 01, 1);
});

final inDaysProvider = Provider.autoDispose.family<int, DateTime>((ref, date) {
  final newYear = ref.watch(newYearDateTimeProvider);
  return date.difference(newYear).inDays;
});

final midnightDateProvider = Provider<DateTime>((ref) {
  final now = DateTime.now().toLocal();
  return DateTime(now.year, now.month, now.day);
});

final _remoteOverviewRepositoryProvider =
    Provider<RemoteOverviewRepository>((ref) {
  final gqlClient = ref.watch(graphQLClientProvider);

  return RemoteOverviewRepository(gqlClient);
});

final overviewServiceProvider = Provider<OverviewService>((ref) {
  final repo = ref.watch(_remoteOverviewRepositoryProvider);
  return OverviewService(repo);
});

final dailyTasksNotifierProvider = StateNotifierProvider.autoDispose
    .family<DailyTasksNotifier, AsyncValue<List<TodoTask>>, DateTime>(
  (ref, date) {
    final service = ref.watch(overviewServiceProvider);

    return DailyTasksNotifier(service, date);
  },
);

final weeklyTasksProvider = StreamProvider.family<List<WeeklyTasks>, DateTime>(
  (ref, from) {
    final service = ref.watch(overviewServiceProvider);
    final to = from.add(const Duration(days: 7));
    return service
        .subscribeTasksOnDateRange(from, to)
        .map((event) => event.value ?? []);
  },
);
