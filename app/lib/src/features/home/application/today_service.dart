import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/domain/todo_task.dart';
import '../data/remote_today_repository.dart';

class TodayService {
  final RemoteTodayRepository _remoteTodayRepository;
  TodayService(this._remoteTodayRepository);

  Stream<AsyncValue<List<TodoTask>>> watchTodayTasks() {
    return _remoteTodayRepository.watchTodayTasks();
  }
}
