import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../client/presentation/client_providers.dart';
import '../../task_management/domain/todo_task.dart';
import '../application/today_service.dart';
import '../data/remote_today_repository.dart';
import 'home_state_notifier.dart';

final _remoteTodayRepository = Provider<RemoteTodayRepository>((ref) {
  final gqlClient = ref.watch(graphQLClientProvider);
  return RemoteTodayRepository(gqlClient);
});

final _todayServiceProvider = Provider.autoDispose<TodayService>((ref) {
  final remoteTodayRepo = ref.watch(_remoteTodayRepository);
  return TodayService(remoteTodayRepo);
});

final homeStateNotifierProvider = StateNotifierProvider.autoDispose<
    HomeStateNotifier, AsyncValue<List<TodoTask>>>(
  (ref) {
    final todayService = ref.watch(_todayServiceProvider);
    return HomeStateNotifier(todayService);
  },
);
