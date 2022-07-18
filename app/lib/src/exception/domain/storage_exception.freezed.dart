// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'storage_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StorageException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformException e) platformException,
    required TResult Function(Object e) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlatformException e)? platformException,
    TResult Function(Object e)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformException e)? platformException,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlatformException value) platformException,
    required TResult Function(_UnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PlatformException value)? platformException,
    TResult Function(_UnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlatformException value)? platformException,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageExceptionCopyWith<$Res> {
  factory $StorageExceptionCopyWith(
          StorageException value, $Res Function(StorageException) then) =
      _$StorageExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$StorageExceptionCopyWithImpl<$Res>
    implements $StorageExceptionCopyWith<$Res> {
  _$StorageExceptionCopyWithImpl(this._value, this._then);

  final StorageException _value;
  // ignore: unused_field
  final $Res Function(StorageException) _then;
}

/// @nodoc
abstract class _$$_PlatformExceptionCopyWith<$Res> {
  factory _$$_PlatformExceptionCopyWith(_$_PlatformException value,
          $Res Function(_$_PlatformException) then) =
      __$$_PlatformExceptionCopyWithImpl<$Res>;
  $Res call({PlatformException e});
}

/// @nodoc
class __$$_PlatformExceptionCopyWithImpl<$Res>
    extends _$StorageExceptionCopyWithImpl<$Res>
    implements _$$_PlatformExceptionCopyWith<$Res> {
  __$$_PlatformExceptionCopyWithImpl(
      _$_PlatformException _value, $Res Function(_$_PlatformException) _then)
      : super(_value, (v) => _then(v as _$_PlatformException));

  @override
  _$_PlatformException get _value => super._value as _$_PlatformException;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_PlatformException(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as PlatformException,
    ));
  }
}

/// @nodoc

class _$_PlatformException extends _PlatformException {
  const _$_PlatformException(this.e) : super._();

  @override
  final PlatformException e;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlatformException &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_PlatformExceptionCopyWith<_$_PlatformException> get copyWith =>
      __$$_PlatformExceptionCopyWithImpl<_$_PlatformException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformException e) platformException,
    required TResult Function(Object e) unknown,
  }) {
    return platformException(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlatformException e)? platformException,
    TResult Function(Object e)? unknown,
  }) {
    return platformException?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformException e)? platformException,
    TResult Function(Object e)? unknown,
    required TResult orElse(),
  }) {
    if (platformException != null) {
      return platformException(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlatformException value) platformException,
    required TResult Function(_UnknownException value) unknown,
  }) {
    return platformException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PlatformException value)? platformException,
    TResult Function(_UnknownException value)? unknown,
  }) {
    return platformException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlatformException value)? platformException,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (platformException != null) {
      return platformException(this);
    }
    return orElse();
  }
}

abstract class _PlatformException extends StorageException {
  const factory _PlatformException(final PlatformException e) =
      _$_PlatformException;
  const _PlatformException._() : super._();

  PlatformException get e;
  @JsonKey(ignore: true)
  _$$_PlatformExceptionCopyWith<_$_PlatformException> get copyWith =>
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
    extends _$StorageExceptionCopyWithImpl<$Res>
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
    required TResult Function(PlatformException e) platformException,
    required TResult Function(Object e) unknown,
  }) {
    return unknown(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PlatformException e)? platformException,
    TResult Function(Object e)? unknown,
  }) {
    return unknown?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformException e)? platformException,
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
    required TResult Function(_PlatformException value) platformException,
    required TResult Function(_UnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PlatformException value)? platformException,
    TResult Function(_UnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlatformException value)? platformException,
    TResult Function(_UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _UnknownException extends StorageException {
  const factory _UnknownException(final Object e) = _$_UnknownException;
  const _UnknownException._() : super._();

  Object get e;
  @JsonKey(ignore: true)
  _$$_UnknownExceptionCopyWith<_$_UnknownException> get copyWith =>
      throw _privateConstructorUsedError;
}
