import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_logo.dart';
import '../../home/home_view.dart';
import 'auth_providers.dart';
import 'sign_in_view.dart';
import 'widgets/email_text_field.dart';

class ForgotPasswordView extends HookConsumerWidget {
  static const path = 'ForgotPasswordView';
  static const routeName = 'ForgotPasswordView';
  static const fullPath = '${SignInView.path}/ForgotPasswordView';
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signInStateNotifierProvider.notifier);

    return Scaffold(
      body: Form(
        child: FocusTraversalGroup(
          policy: ReadingOrderTraversalPolicy(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // Logo
                const AppLogo(),
                const Spacer(),
                // Email
                Consumer(
                  builder: (context, ref, _) => EmailTextField(
                    onChanged: notifier.changeEmail,
                    errorText:
                        ref.watch(signInStateNotifierProvider).emailError,
                  ),
                ),
                const SizedBox(height: 20),
                // Submit
                Consumer(
                  builder: (context, ref, _) => ElevatedButton(
                    onPressed: ref.watch(signInStateNotifierProvider
                            .select((e) => e.canSubmitForgotPassword))
                        ? () async {
                            context.go(HomeView.path);
                            notifier.resetPassword();
                          }
                        : null,
                    child: const Text('Submit'),
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
