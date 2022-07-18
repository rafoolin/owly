import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_entry.freezed.dart';

@freezed
class SignUpEntry with _$SignUpEntry {
  const factory SignUpEntry({
    // User email
    String? email,
    // User password
    String? password,
    // user name
    String? displayName,
    // Error related to email
    String? emailError,
    // error related to password
    String? passwordError,
    // Error related to name
    String? displayNameError,
    // Error related to sign up action
    String? submitError,
    // Whether hide the password on the form or not
    @Default(true) bool obscurePassword,
    // whether it's processing the sign up or not
    @Default(true) bool isLoading,
  }) = _SignUpEntry;

  const SignUpEntry._();

  /// Whether there is at least an error that blocks us from signing up or not
  bool get canSubmit =>
      email != null &&
      password != null &&
      displayName != null &&
      emailError == null &&
      passwordError == null &&
      displayNameError == null;
}
