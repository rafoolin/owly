import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/domain/todo_task.dart';
import '../application/today_service.dart';

class HomeStateNotifier extends StateNotifier<AsyncValue<List<TodoTask>>> {
  final TodayService _todayService;

  HomeStateNotifier(this._todayService) : super(const AsyncLoading()) {
    watchTodayTasks();
  }

  StreamSubscription<AsyncValue<List<TodoTask>>>? sub;

  void watchTodayTasks() {
    sub = _todayService.watchTodayTasks().listen((tasks) => state = tasks);
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }
}
