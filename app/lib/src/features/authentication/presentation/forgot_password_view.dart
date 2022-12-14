import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_logo.dart';
import '../../../common/widgets/app_padding.dart';
import '../../../common/widgets/buttons.dart';
import '../../home/presentation/home_view.dart';
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
                AppPadding.vertical(),
                // Submit
                Consumer(
                  builder: (context, ref, _) => RoundedButton(
                    onPressed: ref.watch(signInStateNotifierProvider
                            .select((e) => e.canSubmitForgotPassword))
                        ? () async {
                            context.go(HomeView.path);
                            notifier.resetPassword();
                          }
                        : null,
                    text: 'Submit',
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
