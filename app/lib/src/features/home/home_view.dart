import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../authentication/presentation/auth_providers.dart';

class HomeView extends HookConsumerWidget {
  static const path = '/';
  static const routeName = 'HomeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            ref.read(signInStateNotifierProvider.notifier).signOut();
          },
          child: const Text('Log out'),
        ),
      ),
    );
  }
}
