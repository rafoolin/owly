import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_logo.dart';
import '../../../common/widgets/custom_text_field.dart';
import 'auth_providers.dart';
import 'sign_in_view.dart';
import 'widgets/email_text_field.dart';
import 'widgets/password_text_field.dart';

class SignUpWithEmailView extends HookConsumerWidget {
  static const path = 'SignUpWithEmailView';
  static const fullPath = '${SignInView.path}/SignUpWithEmailView';
  const SignUpWithEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signUpStateNotifierProvider.notifier);

    ref.listen<String?>(
      signUpStateNotifierProvider.select((state) => state.submitError),
      (_, submitError) {
        if (submitError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(submitError)),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: FocusTraversalGroup(
          policy: ReadingOrderTraversalPolicy(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Logo
                const AppLogo(),
                const Spacer(),
                // Name
                Consumer(
                  builder: (context, ref, _) => CustomTextField(
                    onChanged: notifier.changeDisplayName,
                    hintText: 'Name',
                    errorText: ref.watch(
                      signUpStateNotifierProvider.select(
                        (e) => e.displayNameError,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                // Email
                Consumer(
                  builder: (context, ref, _) => EmailTextField(
                    onChanged: notifier.changeEmail,
                    errorText:
                        ref.watch(signUpStateNotifierProvider).emailError,
                  ),
                ),
                const SizedBox(height: 10.0),
                // Password
                Consumer(
                  builder: (context, ref, _) {
                    final passwordError = ref.watch(
                      signInStateNotifierProvider
                          .select((v) => v.passwordError),
                    );
                    final obscurePassword = ref.watch(
                      signInStateNotifierProvider
                          .select((v) => v.obscurePassword),
                    );
                    return PasswordTextField(
                      onChanged: notifier.changePassword,
                      errorText: passwordError,
                      obscureText: obscurePassword,
                      toggleObscurePassword: notifier.toggleObscurePassword,
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Submit
                Consumer(
                  builder: (context, ref, _) => ElevatedButton(
                    onPressed: ref.watch(signUpStateNotifierProvider
                            .select((e) => e.canSubmit))
                        ? notifier.signUpEmailPassword
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
