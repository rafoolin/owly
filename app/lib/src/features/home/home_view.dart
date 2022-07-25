import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../profile/presentation/profile_view.dart';
import '../task_management/presentation/category_view.dart';

class HomeView extends HookConsumerWidget {
  static const path = '/';
  static const routeName = 'HomeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => context.push(CategoryView.path),
              child: const Text('Categories'),
            ),
            TextButton(
              onPressed: () => context.push(ProfileView.path),
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
