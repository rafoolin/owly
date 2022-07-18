import 'package:email_validator/email_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../exception/domain/app_exception.dart';
import '../application/auth_service.dart';
import '../domain/sign_up_entry.dart';

class SignUpStateNotifier extends StateNotifier<SignUpEntry> {
  final AuthService _authService;
  SignUpStateNotifier(this._authService) : super(const SignUpEntry());

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

  void changeDisplayName(String displayName) {
    displayName = displayName.trim();
    state = state.copyWith(
      displayName: displayName,
      displayNameError: displayName.isEmpty ? 'Name is required' : null,
      submitError: null,
    );
  }

  void toggleObscurePassword() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
      submitError: null,
    );
  }

  Future<void> signUpEmailPassword() async {
    if (!state.canSubmit) {
      return;
    }
    state = state.copyWith(isLoading: true, submitError: null);
    final response = await _authService.signUpEmailPassword(
      email: state.email!,
      password: state.password!,
      displayName: state.displayName,
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
}
