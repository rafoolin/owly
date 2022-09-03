import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/domain/todo_task.dart';
import '../data/remote_overview_repository.dart';
import '../weekly/domain/weekly_tasks.dart';

class OverviewService {
  final RemoteOverviewRepository _remoteOverviewRepository;

  OverviewService(this._remoteOverviewRepository);

  Stream<AsyncValue<List<TodoTask>>> subscribeTasksOnDate(DateTime dateTime) {
    return _remoteOverviewRepository.subscribeTasksOnDate(dateTime);
  }

  Stream<AsyncValue<List<WeeklyTasks>>> subscribeTasksOnDateRange(
    DateTime from,
    DateTime to,
  ) {
    return _remoteOverviewRepository.subscribeTasksOnDateRange(from, to);
  }
}
