// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flavor_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlavorConfig {
  AppFlavor get flavor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlavorConfigCopyWith<FlavorConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorConfigCopyWith<$Res> {
  factory $FlavorConfigCopyWith(
          FlavorConfig value, $Res Function(FlavorConfig) then) =
      _$FlavorConfigCopyWithImpl<$Res>;
  $Res call({AppFlavor flavor});
}

/// @nodoc
class _$FlavorConfigCopyWithImpl<$Res> implements $FlavorConfigCopyWith<$Res> {
  _$FlavorConfigCopyWithImpl(this._value, this._then);

  final FlavorConfig _value;
  // ignore: unused_field
  final $Res Function(FlavorConfig) _then;

  @override
  $Res call({
    Object? flavor = freezed,
  }) {
    return _then(_value.copyWith(
      flavor: flavor == freezed
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as AppFlavor,
    ));
  }
}

/// @nodoc
abstract class _$$_FlavorConfigCopyWith<$Res>
    implements $FlavorConfigCopyWith<$Res> {
  factory _$$_FlavorConfigCopyWith(
          _$_FlavorConfig value, $Res Function(_$_FlavorConfig) then) =
      __$$_FlavorConfigCopyWithImpl<$Res>;
  @override
  $Res call({AppFlavor flavor});
}

/// @nodoc
class __$$_FlavorConfigCopyWithImpl<$Res>
    extends _$FlavorConfigCopyWithImpl<$Res>
    implements _$$_FlavorConfigCopyWith<$Res> {
  __$$_FlavorConfigCopyWithImpl(
      _$_FlavorConfig _value, $Res Function(_$_FlavorConfig) _then)
      : super(_value, (v) => _then(v as _$_FlavorConfig));

  @override
  _$_FlavorConfig get _value => super._value as _$_FlavorConfig;

  @override
  $Res call({
    Object? flavor = freezed,
  }) {
    return _then(_$_FlavorConfig(
      flavor == freezed
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as AppFlavor,
    ));
  }
}

/// @nodoc

class _$_FlavorConfig implements _FlavorConfig {
  _$_FlavorConfig(this.flavor);

  @override
  final AppFlavor flavor;

  @override
  String toString() {
    return 'FlavorConfig(flavor: $flavor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlavorConfig &&
            const DeepCollectionEquality().equals(other.flavor, flavor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(flavor));

  @JsonKey(ignore: true)
  @override
  _$$_FlavorConfigCopyWith<_$_FlavorConfig> get copyWith =>
      __$$_FlavorConfigCopyWithImpl<_$_FlavorConfig>(this, _$identity);
}

abstract class _FlavorConfig implements FlavorConfig {
  factory _FlavorConfig(final AppFlavor flavor) = _$_FlavorConfig;

  @override
  AppFlavor get flavor;
  @override
  @JsonKey(ignore: true)
  _$$_FlavorConfigCopyWith<_$_FlavorConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
