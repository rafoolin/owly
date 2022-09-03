import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_padding.dart';
import '../../task_management/add_task/presentation/add_task_view.dart';
import 'home_providers.dart';
import 'widgets/home_drawer.dart';
import 'widgets/task_card.dart';

class HomeView extends HookConsumerWidget {
  static const path = '/';
  static const routeName = 'HomeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider);

    return Scaffold(
      drawer: const HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.plus),
        onPressed: () => context.push(AddTaskView.path),
      ),
      appBar: AppBar(title: const Text('Today')),
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
