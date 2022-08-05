import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/domain/todo_task.dart';
import '../application/today_service.dart';

class HomeStateNotifier extends StateNotifier<AsyncValue<List<TodoTask>>> {
  final TodayService _todayService;

  HomeStateNotifier(this._todayService) : super(const AsyncLoading()) {
    _subscribeTodayTasks();
  }

  StreamSubscription<AsyncValue<List<TodoTask>>>? _sub;

  void _subscribeTodayTasks() {
    _sub?.cancel();
    _sub = _todayService.subscribeTodayTasks().listen((tasks) => state = tasks);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
