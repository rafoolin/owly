// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddCategory {
  String? get name => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCategoryCopyWith<AddCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryCopyWith<$Res> {
  factory $AddCategoryCopyWith(
          AddCategory value, $Res Function(AddCategory) then) =
      _$AddCategoryCopyWithImpl<$Res>;
  $Res call({String? name, Color? color});
}

/// @nodoc
class _$AddCategoryCopyWithImpl<$Res> implements $AddCategoryCopyWith<$Res> {
  _$AddCategoryCopyWithImpl(this._value, this._then);

  final AddCategory _value;
  // ignore: unused_field
  final $Res Function(AddCategory) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddCategoryCopyWith<$Res>
    implements $AddCategoryCopyWith<$Res> {
  factory _$$_AddCategoryCopyWith(
          _$_AddCategory value, $Res Function(_$_AddCategory) then) =
      __$$_AddCategoryCopyWithImpl<$Res>;
  @override
  $Res call({String? name, Color? color});
}

/// @nodoc
class __$$_AddCategoryCopyWithImpl<$Res> extends _$AddCategoryCopyWithImpl<$Res>
    implements _$$_AddCategoryCopyWith<$Res> {
  __$$_AddCategoryCopyWithImpl(
      _$_AddCategory _value, $Res Function(_$_AddCategory) _then)
      : super(_value, (v) => _then(v as _$_AddCategory));

  @override
  _$_AddCategory get _value => super._value as _$_AddCategory;

  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_AddCategory(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_AddCategory extends _AddCategory {
  _$_AddCategory({this.name, this.color}) : super._();

  @override
  final String? name;
  @override
  final Color? color;

  @override
  String toString() {
    return 'AddCategory(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCategory &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$_AddCategoryCopyWith<_$_AddCategory> get copyWith =>
      __$$_AddCategoryCopyWithImpl<_$_AddCategory>(this, _$identity);
}

abstract class _AddCategory extends AddCategory {
  factory _AddCategory({final String? name, final Color? color}) =
      _$_AddCategory;
  _AddCategory._() : super._();

  @override
  String? get name;
  @override
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$$_AddCategoryCopyWith<_$_AddCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
