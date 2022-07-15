import 'package:email_validator/email_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../exception/domain/app_exception.dart';
import '../application/auth_service.dart';
import '../domain/sign_in_entry.dart';

class SignInStateNotifier extends StateNotifier<SignInEntry> {
  final AuthService _authService;
  SignInStateNotifier(this._authService) : super(const SignInEntry());

  void changeEmail(String email) {
    email = email.trim();
    state = state.copyWith(
      email: email,
      emailError: EmailValidator.validate(email) ? null : 'Invalid email',
      submitError: null,
    );
  }

  void changePassword(String password) {
    password = password.trim();
    state = state.copyWith(
      password: password,
      passwordError: password.isEmpty ? 'Password is required' : null,
      submitError: null,
    );
  }

  void toggleObscurePassword() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
      submitError: null,
    );
  }

  Future<void> signIn() async {
    state = state.copyWith(isLoading: true, submitError: null);
    final response = await _authService.signInEmailPassword(
      email: state.email,
      password: state.password,
    );

    response.when(
      data: ((_) {}),
      error: (error, _) => state = state.copyWith(
        isLoading: false,
        submitError: (error as AppException).errorMessage,
      ),
      loading: () => state = state.copyWith(isLoading: true),
    );
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, submitError: null);
    final response = await _authService.signOut();

    response.when(
      data: ((_) {}),
      error: (error, _) => state = state.copyWith(
        isLoading: false,
        submitError: (error as AppException).errorMessage,
      ),
      loading: () => state = state.copyWith(isLoading: true),
    );
  }

  Future<void> resetPassword() async {
    // Ignore this function if [email] is invalid
    if (!state.canSubmitForgotPassword) {
      return;
    }
    state = state.copyWith(isLoading: true, submitError: null);
    final response = await _authService.resetPassword(state.email!);

    state = response.when(
      data: (_) => state.copyWith(
        isLoading: false,
        submitError: null,
        email: null,
        resetPasswordMessage: 'Please check your email',
      ),
      error: (error, _) => state.copyWith(
        isLoading: false,
        submitError: (error as AppException).errorMessage,
      ),
      loading: () => state.copyWith(isLoading: true),
    );
  }
}
