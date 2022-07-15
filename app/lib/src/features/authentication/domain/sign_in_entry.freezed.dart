// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInEntry {
// User email
  String? get email => throw _privateConstructorUsedError; // User password
  String? get password =>
      throw _privateConstructorUsedError; // Error related to email
  String? get emailError =>
      throw _privateConstructorUsedError; // error related to password
  String? get passwordError =>
      throw _privateConstructorUsedError; // Error related to sign up action
  String? get submitError =>
      throw _privateConstructorUsedError; // An error message or a message to user to check their email
  String? get resetPasswordMessage =>
      throw _privateConstructorUsedError; // Whether hide the password on the form or not
  bool get obscurePassword =>
      throw _privateConstructorUsedError; // whether it's processing the sign up or not
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInEntryCopyWith<SignInEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEntryCopyWith<$Res> {
  factory $SignInEntryCopyWith(
          SignInEntry value, $Res Function(SignInEntry) then) =
      _$SignInEntryCopyWithImpl<$Res>;
  $Res call(
      {String? email,
      String? password,
      String? emailError,
      String? passwordError,
      String? submitError,
      String? resetPasswordMessage,
      bool obscurePassword,
      bool isLoading});
}

/// @nodoc
class _$SignInEntryCopyWithImpl<$Res> implements $SignInEntryCopyWith<$Res> {
  _$SignInEntryCopyWithImpl(this._value, this._then);

  final SignInEntry _value;
  // ignore: unused_field
  final $Res Function(SignInEntry) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? submitError = freezed,
    Object? resetPasswordMessage = freezed,
    Object? obscurePassword = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: passwordError == freezed
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      submitError: submitError == freezed
          ? _value.submitError
          : submitError // ignore: cast_nullable_to_non_nullable
              as String?,
      resetPasswordMessage: resetPasswordMessage == freezed
          ? _value.resetPasswordMessage
          : resetPasswordMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      obscurePassword: obscurePassword == freezed
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SignInEntryCopyWith<$Res>
    implements $SignInEntryCopyWith<$Res> {
  factory _$$_SignInEntryCopyWith(
          _$_SignInEntry value, $Res Function(_$_SignInEntry) then) =
      __$$_SignInEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? email,
      String? password,
      String? emailError,
      String? passwordError,
      String? submitError,
      String? resetPasswordMessage,
      bool obscurePassword,
      bool isLoading});
}

/// @nodoc
class __$$_SignInEntryCopyWithImpl<$Res> extends _$SignInEntryCopyWithImpl<$Res>
    implements _$$_SignInEntryCopyWith<$Res> {
  __$$_SignInEntryCopyWithImpl(
      _$_SignInEntry _value, $Res Function(_$_SignInEntry) _then)
      : super(_value, (v) => _then(v as _$_SignInEntry));

  @override
  _$_SignInEntry get _value => super._value as _$_SignInEntry;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? submitError = freezed,
    Object? resetPasswordMessage = freezed,
    Object? obscurePassword = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_SignInEntry(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: passwordError == freezed
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      submitError: submitError == freezed
          ? _value.submitError
          : submitError // ignore: cast_nullable_to_non_nullable
              as String?,
      resetPasswordMessage: resetPasswordMessage == freezed
          ? _value.resetPasswordMessage
          : resetPasswordMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      obscurePassword: obscurePassword == freezed
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInEntry extends _SignInEntry {
  const _$_SignInEntry(
      {this.email,
      this.password,
      this.emailError,
      this.passwordError,
      this.submitError,
      this.resetPasswordMessage,
      this.obscurePassword = true,
      this.isLoading = true})
      : super._();

// User email
  @override
  final String? email;
// User password
  @override
  final String? password;
// Error related to email
  @override
  final String? emailError;
// error related to password
  @override
  final String? passwordError;
// Error related to sign up action
  @override
  final String? submitError;
// An error message or a message to user to check their email
  @override
  final String? resetPasswordMessage;
// Whether hide the password on the form or not
  @override
  @JsonKey()
  final bool obscurePassword;
// whether it's processing the sign up or not
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SignInEntry(email: $email, password: $password, emailError: $emailError, passwordError: $passwordError, submitError: $submitError, resetPasswordMessage: $resetPasswordMessage, obscurePassword: $obscurePassword, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInEntry &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.emailError, emailError) &&
            const DeepCollectionEquality()
                .equals(other.passwordError, passwordError) &&
            const DeepCollectionEquality()
                .equals(other.submitError, submitError) &&
            const DeepCollectionEquality()
                .equals(other.resetPasswordMessage, resetPasswordMessage) &&
            const DeepCollectionEquality()
                .equals(other.obscurePassword, obscurePassword) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(emailError),
      const DeepCollectionEquality().hash(passwordError),
      const DeepCollectionEquality().hash(submitError),
      const DeepCollectionEquality().hash(resetPasswordMessage),
      const DeepCollectionEquality().hash(obscurePassword),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_SignInEntryCopyWith<_$_SignInEntry> get copyWith =>
      __$$_SignInEntryCopyWithImpl<_$_SignInEntry>(this, _$identity);
}

abstract class _SignInEntry extends SignInEntry {
  const factory _SignInEntry(
      {final String? email,
      final String? password,
      final String? emailError,
      final String? passwordError,
      final String? submitError,
      final String? resetPasswordMessage,
      final bool obscurePassword,
      final bool isLoading}) = _$_SignInEntry;
  const _SignInEntry._() : super._();

  @override // User email
  String? get email;
  @override // User password
  String? get password;
  @override // Error related to email
  String? get emailError;
  @override // error related to password
  String? get passwordError;
  @override // Error related to sign up action
  String? get submitError;
  @override // An error message or a message to user to check their email
  String? get resetPasswordMessage;
  @override // Whether hide the password on the form or not
  bool get obscurePassword;
  @override // whether it's processing the sign up or not
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_SignInEntryCopyWith<_$_SignInEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
