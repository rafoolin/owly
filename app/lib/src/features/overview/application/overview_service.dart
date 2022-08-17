import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../task_management/domain/todo_task.dart';
import '../data/remote_overview_repository.dart';

class OverviewService {
  final RemoteOverviewRepository _remoteOverviewRepository;

  OverviewService(this._remoteOverviewRepository);

  Stream<AsyncValue<List<TodoTask>>> subscribeTasksOnDate(DateTime dateTime) {
    return _remoteOverviewRepository.subscribeTasksOnDate(dateTime);
  }
}
