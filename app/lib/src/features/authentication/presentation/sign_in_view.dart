import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_logo.dart';
import 'auth_providers.dart';
import 'forgot_password_view.dart';
import 'sign_up_with_email_view.dart';
import 'widgets/email_text_field.dart';
import 'widgets/password_text_field.dart';

class SignInView extends HookConsumerWidget {
  static const path = '/SignInView';
  static const routeName = 'SignInView';
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signInStateNotifierProvider.notifier);

    ref.listen<String?>(
      signInStateNotifierProvider.select((state) => state.submitError),
      (_, submitError) {
        if (submitError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(submitError)),
          );
        }
      },
    );

    ref.listen<String?>(
      signInStateNotifierProvider.select((state) => state.resetPasswordMessage),
      (_, resetMessage) {
        if (resetMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resetMessage)),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => context.push(ForgotPasswordView.fullPath),
                    child: const Text('Forgot password?'),
                  ),
                ),
                // Submit
                Consumer(
                  builder: (context, ref, _) => ElevatedButton(
                    onPressed: ref.watch(signInStateNotifierProvider
                            .select((e) => e.canSubmit))
                        ? notifier.signIn
                        : null,
                    child: const Text('log in'),
                  ),
                ),
                const SizedBox(height: 16.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey),
                    text: 'Don`t have an account? ',
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () => context.go(SignUpWithEmailView.fullPath),
                          child: Text(
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.blue[700],
                                      decoration: TextDecoration.underline,
                                    ),
                            'Click here',
                          ),
                        ),
                      ),
                    ],
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
