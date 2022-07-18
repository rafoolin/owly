// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiException e) apiException,
    required TResult Function(AuthServiceException e) authServiceException,
    required TResult Function(ClientException e) clientException,
    required TResult Function(ArgumentError e) argumentError,
    required TResult Function(Object e) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIException value) apiException,
    required TResult Function(_AuthServiceException value) authServiceException,
    required TResult Function(_ClientException value) clientException,
    required TResult Function(_ArgumentError value) argumentError,
    required TResult Function(_UnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthExceptionCopyWith<$Res> {
  factory $AuthExceptionCopyWith(
          AuthException value, $Res Function(AuthException) then) =
      _$AuthExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._value, this._then);

  final AuthException _value;
  // ignore: unused_field
  final $Res Function(AuthException) _then;
}

/// @nodoc
abstract class _$$_APIExceptionCopyWith<$Res> {
  factory _$$_APIExceptionCopyWith(
          _$_APIException value, $Res Function(_$_APIException) then) =
      __$$_APIExceptionCopyWithImpl<$Res>;
  $Res call({ApiException e});
}

/// @nodoc
class __$$_APIExceptionCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$_APIExceptionCopyWith<$Res> {
  __$$_APIExceptionCopyWithImpl(
      _$_APIException _value, $Res Function(_$_APIException) _then)
      : super(_value, (v) => _then(v as _$_APIException));

  @override
  _$_APIException get _value => super._value as _$_APIException;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_APIException(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ApiException,
    ));
  }
}

/// @nodoc

class _$_APIException extends _APIException {
  const _$_APIException(this.e) : super._();

  @override
  final ApiException e;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_APIException &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_APIExceptionCopyWith<_$_APIException> get copyWith =>
      __$$_APIExceptionCopyWithImpl<_$_APIException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiException e) apiException,
    required TResult Function(AuthServiceException e) authServiceException,
    required TResult Function(ClientException e) clientException,
    required TResult Function(ArgumentError e) argumentError,
    required TResult Function(Object e) unknown,
  }) {
    return apiException(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
  }) {
    return apiException?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) {
    if (apiException != null) {
      return apiException(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIException value) apiException,
    required TResult Function(_AuthServiceException value) authServiceException,
    required TResult Function(_ClientException value) clientException,
    required TResult Function(_ArgumentError value) argumentError,
    required TResult Function(_UnknownException value) unknown,
  }) {
    return apiException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
  }) {
    return apiException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (apiException != null) {
      return apiException(this);
    }
    return orElse();
  }
}

abstract class _APIException extends AuthException {
  const factory _APIException(final ApiException e) = _$_APIException;
  const _APIException._() : super._();

  ApiException get e;
  @JsonKey(ignore: true)
  _$$_APIExceptionCopyWith<_$_APIException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthServiceExceptionCopyWith<$Res> {
  factory _$$_AuthServiceExceptionCopyWith(_$_AuthServiceException value,
          $Res Function(_$_AuthServiceException) then) =
      __$$_AuthServiceExceptionCopyWithImpl<$Res>;
  $Res call({AuthServiceException e});
}

/// @nodoc
class __$$_AuthServiceExceptionCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$_AuthServiceExceptionCopyWith<$Res> {
  __$$_AuthServiceExceptionCopyWithImpl(_$_AuthServiceException _value,
      $Res Function(_$_AuthServiceException) _then)
      : super(_value, (v) => _then(v as _$_AuthServiceException));

  @override
  _$_AuthServiceException get _value => super._value as _$_AuthServiceException;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_AuthServiceException(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as AuthServiceException,
    ));
  }
}

/// @nodoc

class _$_AuthServiceException extends _AuthServiceException {
  const _$_AuthServiceException(this.e) : super._();

  @override
  final AuthServiceException e;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthServiceException &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_AuthServiceExceptionCopyWith<_$_AuthServiceException> get copyWith =>
      __$$_AuthServiceExceptionCopyWithImpl<_$_AuthServiceException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiException e) apiException,
    required TResult Function(AuthServiceException e) authServiceException,
    required TResult Function(ClientException e) clientException,
    required TResult Function(ArgumentError e) argumentError,
    required TResult Function(Object e) unknown,
  }) {
    return authServiceException(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
  }) {
    return authServiceException?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) {
    if (authServiceException != null) {
      return authServiceException(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIException value) apiException,
    required TResult Function(_AuthServiceException value) authServiceException,
    required TResult Function(_ClientException value) clientException,
    required TResult Function(_ArgumentError value) argumentError,
    required TResult Function(_UnknownException value) unknown,
  }) {
    return authServiceException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
  }) {
    return authServiceException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (authServiceException != null) {
      return authServiceException(this);
    }
    return orElse();
  }
}

abstract class _AuthServiceException extends AuthException {
  const factory _AuthServiceException(final AuthServiceException e) =
      _$_AuthServiceException;
  const _AuthServiceException._() : super._();

  AuthServiceException get e;
  @JsonKey(ignore: true)
  _$$_AuthServiceExceptionCopyWith<_$_AuthServiceException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClientExceptionCopyWith<$Res> {
  factory _$$_ClientExceptionCopyWith(
          _$_ClientException value, $Res Function(_$_ClientException) then) =
      __$$_ClientExceptionCopyWithImpl<$Res>;
  $Res call({ClientException e});
}

/// @nodoc
class __$$_ClientExceptionCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$_ClientExceptionCopyWith<$Res> {
  __$$_ClientExceptionCopyWithImpl(
      _$_ClientException _value, $Res Function(_$_ClientException) _then)
      : super(_value, (v) => _then(v as _$_ClientException));

  @override
  _$_ClientException get _value => super._value as _$_ClientException;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_ClientException(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ClientException,
    ));
  }
}

/// @nodoc

class _$_ClientException extends _ClientException {
  const _$_ClientException(this.e) : super._();

  @override
  final ClientException e;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientException &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_ClientExceptionCopyWith<_$_ClientException> get copyWith =>
      __$$_ClientExceptionCopyWithImpl<_$_ClientException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiException e) apiException,
    required TResult Function(AuthServiceException e) authServiceException,
    required TResult Function(ClientException e) clientException,
    required TResult Function(ArgumentError e) argumentError,
    required TResult Function(Object e) unknown,
  }) {
    return clientException(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
  }) {
    return clientException?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) {
    if (clientException != null) {
      return clientException(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIException value) apiException,
    required TResult Function(_AuthServiceException value) authServiceException,
    required TResult Function(_ClientException value) clientException,
    required TResult Function(_ArgumentError value) argumentError,
    required TResult Function(_UnknownException value) unknown,
  }) {
    return clientException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
  }) {
    return clientException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (clientException != null) {
      return clientException(this);
    }
    return orElse();
  }
}

abstract class _ClientException extends AuthException {
  const factory _ClientException(final ClientException e) = _$_ClientException;
  const _ClientException._() : super._();

  ClientException get e;
  @JsonKey(ignore: true)
  _$$_ClientExceptionCopyWith<_$_ClientException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ArgumentErrorCopyWith<$Res> {
  factory _$$_ArgumentErrorCopyWith(
          _$_ArgumentError value, $Res Function(_$_ArgumentError) then) =
      __$$_ArgumentErrorCopyWithImpl<$Res>;
  $Res call({ArgumentError e});
}

/// @nodoc
class __$$_ArgumentErrorCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$_ArgumentErrorCopyWith<$Res> {
  __$$_ArgumentErrorCopyWithImpl(
      _$_ArgumentError _value, $Res Function(_$_ArgumentError) _then)
      : super(_value, (v) => _then(v as _$_ArgumentError));

  @override
  _$_ArgumentError get _value => super._value as _$_ArgumentError;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_ArgumentError(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ArgumentError,
    ));
  }
}

/// @nodoc

class _$_ArgumentError extends _ArgumentError {
  const _$_ArgumentError(this.e) : super._();

  @override
  final ArgumentError e;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArgumentError &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_ArgumentErrorCopyWith<_$_ArgumentError> get copyWith =>
      __$$_ArgumentErrorCopyWithImpl<_$_ArgumentError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiException e) apiException,
    required TResult Function(AuthServiceException e) authServiceException,
    required TResult Function(ClientException e) clientException,
    required TResult Function(ArgumentError e) argumentError,
    required TResult Function(Object e) unknown,
  }) {
    return argumentError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
  }) {
    return argumentError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) {
    if (argumentError != null) {
      return argumentError(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIException value) apiException,
    required TResult Function(_AuthServiceException value) authServiceException,
    required TResult Function(_ClientException value) clientException,
    required TResult Function(_ArgumentError value) argumentError,
    required TResult Function(_UnknownException value) unknown,
  }) {
    return argumentError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
  }) {
    return argumentError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (argumentError != null) {
      return argumentError(this);
    }
    return orElse();
  }
}

abstract class _ArgumentError extends AuthException {
  const factory _ArgumentError(final ArgumentError e) = _$_ArgumentError;
  const _ArgumentError._() : super._();

  ArgumentError get e;
  @JsonKey(ignore: true)
  _$$_ArgumentErrorCopyWith<_$_ArgumentError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnknownExceptionCopyWith<$Res> {
  factory _$$_UnknownExceptionCopyWith(
          _$_UnknownException value, $Res Function(_$_UnknownException) then) =
      __$$_UnknownExceptionCopyWithImpl<$Res>;
  $Res call({Object e});
}

/// @nodoc
class __$$_UnknownExceptionCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res>
    implements _$$_UnknownExceptionCopyWith<$Res> {
  __$$_UnknownExceptionCopyWithImpl(
      _$_UnknownException _value, $Res Function(_$_UnknownException) _then)
      : super(_value, (v) => _then(v as _$_UnknownException));

  @override
  _$_UnknownException get _value => super._value as _$_UnknownException;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_UnknownException(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$_UnknownException extends _UnknownException {
  const _$_UnknownException(this.e) : super._();

  @override
  final Object e;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnknownException &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_UnknownExceptionCopyWith<_$_UnknownException> get copyWith =>
      __$$_UnknownExceptionCopyWithImpl<_$_UnknownException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiException e) apiException,
    required TResult Function(AuthServiceException e) authServiceException,
    required TResult Function(ClientException e) clientException,
    required TResult Function(ArgumentError e) argumentError,
    required TResult Function(Object e) unknown,
  }) {
    return unknown(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
  }) {
    return unknown?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiException e)? apiException,
    TResult Function(AuthServiceException e)? authServiceException,
    TResult Function(ClientException e)? clientException,
    TResult Function(ArgumentError e)? argumentError,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIException value) apiException,
    required TResult Function(_AuthServiceException value) authServiceException,
    required TResult Function(_ClientException value) clientException,
    required TResult Function(_ArgumentError value) argumentError,
    required TResult Function(_UnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIException value)? apiException,
    TResult Function(_AuthServiceException value)? authServiceException,
    TResult Function(_ClientException value)? clientException,
    TResult Function(_ArgumentError value)? argumentError,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _UnknownException extends AuthException {
  const factory _UnknownException(final Object e) = _$_UnknownException;
  const _UnknownException._() : super._();

  Object get e;
  @JsonKey(ignore: true)
  _$$_UnknownExceptionCopyWith<_$_UnknownException> get copyWith =>
      throw _privateConstructorUsedError;
}
