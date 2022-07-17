import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_logo.dart';
import '../../../common/widgets/app_padding.dart';
import '../../../common/widgets/buttons.dart';
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
                  builder: (context, ref, _) => CustomTextField.form(
                    onChanged: notifier.changeDisplayName,
                    hintText: 'Name',
                    errorText: ref.watch(
                      signUpStateNotifierProvider.select(
                        (e) => e.displayNameError,
                      ),
                    ),
                  ),
                ),
                AppPadding.vertical(),
                // Email
                Consumer(
                  builder: (context, ref, _) => EmailTextField(
                    onChanged: notifier.changeEmail,
                    errorText:
                        ref.watch(signUpStateNotifierProvider).emailError,
                  ),
                ),
                AppPadding.vertical(),
                // Password
                Consumer(
                  builder: (context, ref, _) {
                    final passwordError = ref.watch(
                      signUpStateNotifierProvider
                          .select((v) => v.passwordError),
                    );
                    final obscurePassword = ref.watch(
                      signUpStateNotifierProvider
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
                AppPadding.vertical(),
                // Submit
                Consumer(
                  builder: (context, ref, _) => RoundedButton(
                    onPressed: ref.watch(signUpStateNotifierProvider
                            .select((e) => e.canSubmit))
                        ? notifier.signUpEmailPassword
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
