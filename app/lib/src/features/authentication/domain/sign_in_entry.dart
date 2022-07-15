import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_entry.freezed.dart';

@freezed
class SignInEntry with _$SignInEntry {
  const factory SignInEntry({
    // User email
    String? email,
    // User password
    String? password,
    // Error related to email
    String? emailError,
    // error related to password
    String? passwordError,
    // Error related to sign up action
    String? submitError,
    // Whether hide the password on the form or not
    @Default(true) bool obscurePassword,
    // whether it's processing the sign up or not
    @Default(true) bool isLoading,
  }) = _SignInEntry;

  const SignInEntry._();

  /// Whether there is at least an error that blocks us from signing up or not
  bool get canSubmit =>
      email != null &&
      password != null &&
      emailError == null &&
      passwordError == null;
}
