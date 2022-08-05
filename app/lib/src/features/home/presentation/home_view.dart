import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_padding.dart';
import 'home_providers.dart';
import 'widgets/task_card.dart';

class HomeView extends HookConsumerWidget {
  static const path = '/';
  static const routeName = 'HomeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: state.when(
        data: (tasks) {
          return ListView.builder(
            padding: AppPadding.topPadding,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) =>
                TaskCard(task: tasks[index]),
          );
        },
        error: (e, _) => const Text('Error'),
        loading: () => const Center(child: LinearProgressIndicator()),
      ),
    );
  }
}