import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../task_management/domain/todo_task.dart';
import '../../application/overview_service.dart';

// TODO:: Replace with stream provider if UI remains the same
class DailyTasksNotifier extends StateNotifier<AsyncValue<List<TodoTask>>> {
  final OverviewService _overviewService;
  final DateTime _dateTime;
  DailyTasksNotifier(this._overviewService, this._dateTime)
      : super(const AsyncLoading()) {
    _watchTasks();
  }
  StreamSubscription<AsyncValue<List<TodoTask>>>? _sub;

  void _watchTasks() {
    _sub?.cancel();
    _sub = _overviewService
        .subscribeTasksOnDate(_dateTime)
        .listen((tasks) => state = tasks);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
