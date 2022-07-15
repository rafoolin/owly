// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppCredential {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppCredentialCopyWith<AppCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppCredentialCopyWith<$Res> {
  factory $AppCredentialCopyWith(
          AppCredential value, $Res Function(AppCredential) then) =
      _$AppCredentialCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$AppCredentialCopyWithImpl<$Res>
    implements $AppCredentialCopyWith<$Res> {
  _$AppCredentialCopyWithImpl(this._value, this._then);

  final AppCredential _value;
  // ignore: unused_field
  final $Res Function(AppCredential) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AppCredentialCopyWith<$Res>
    implements $AppCredentialCopyWith<$Res> {
  factory _$$_AppCredentialCopyWith(
          _$_AppCredential value, $Res Function(_$_AppCredential) then) =
      __$$_AppCredentialCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$$_AppCredentialCopyWithImpl<$Res>
    extends _$AppCredentialCopyWithImpl<$Res>
    implements _$$_AppCredentialCopyWith<$Res> {
  __$$_AppCredentialCopyWithImpl(
      _$_AppCredential _value, $Res Function(_$_AppCredential) _then)
      : super(_value, (v) => _then(v as _$_AppCredential));

  @override
  _$_AppCredential get _value => super._value as _$_AppCredential;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_AppCredential(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppCredential implements _AppCredential {
  _$_AppCredential({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AppCredential(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppCredential &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_AppCredentialCopyWith<_$_AppCredential> get copyWith =>
      __$$_AppCredentialCopyWithImpl<_$_AppCredential>(this, _$identity);
}

abstract class _AppCredential implements AppCredential {
  factory _AppCredential(
      {required final String email,
      required final String password}) = _$_AppCredential;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_AppCredentialCopyWith<_$_AppCredential> get copyWith =>
      throw _privateConstructorUsedError;
}
