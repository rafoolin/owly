// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditCategory {
  TodoCategory? get initial => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCategoryCopyWith<EditCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCategoryCopyWith<$Res> {
  factory $EditCategoryCopyWith(
          EditCategory value, $Res Function(EditCategory) then) =
      _$EditCategoryCopyWithImpl<$Res>;
  $Res call({TodoCategory? initial, String? name, Color? color});

  $TodoCategoryCopyWith<$Res>? get initial;
}

/// @nodoc
class _$EditCategoryCopyWithImpl<$Res> implements $EditCategoryCopyWith<$Res> {
  _$EditCategoryCopyWithImpl(this._value, this._then);

  final EditCategory _value;
  // ignore: unused_field
  final $Res Function(EditCategory) _then;

  @override
  $Res call({
    Object? initial = freezed,
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      initial: initial == freezed
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as TodoCategory?,
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

  @override
  $TodoCategoryCopyWith<$Res>? get initial {
    if (_value.initial == null) {
      return null;
    }

    return $TodoCategoryCopyWith<$Res>(_value.initial!, (value) {
      return _then(_value.copyWith(initial: value));
    });
  }
}

/// @nodoc
abstract class _$$_EditCategoryCopyWith<$Res>
    implements $EditCategoryCopyWith<$Res> {
  factory _$$_EditCategoryCopyWith(
          _$_EditCategory value, $Res Function(_$_EditCategory) then) =
      __$$_EditCategoryCopyWithImpl<$Res>;
  @override
  $Res call({TodoCategory? initial, String? name, Color? color});

  @override
  $TodoCategoryCopyWith<$Res>? get initial;
}

/// @nodoc
class __$$_EditCategoryCopyWithImpl<$Res>
    extends _$EditCategoryCopyWithImpl<$Res>
    implements _$$_EditCategoryCopyWith<$Res> {
  __$$_EditCategoryCopyWithImpl(
      _$_EditCategory _value, $Res Function(_$_EditCategory) _then)
      : super(_value, (v) => _then(v as _$_EditCategory));

  @override
  _$_EditCategory get _value => super._value as _$_EditCategory;

  @override
  $Res call({
    Object? initial = freezed,
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_EditCategory(
      initial: initial == freezed
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as TodoCategory?,
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

class _$_EditCategory extends _EditCategory {
  _$_EditCategory({this.initial, this.name, this.color}) : super._();

  @override
  final TodoCategory? initial;
  @override
  final String? name;
  @override
  final Color? color;

  @override
  String toString() {
    return 'EditCategory(initial: $initial, name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditCategory &&
            const DeepCollectionEquality().equals(other.initial, initial) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initial),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$_EditCategoryCopyWith<_$_EditCategory> get copyWith =>
      __$$_EditCategoryCopyWithImpl<_$_EditCategory>(this, _$identity);
}

abstract class _EditCategory extends EditCategory {
  factory _EditCategory(
      {final TodoCategory? initial,
      final String? name,
      final Color? color}) = _$_EditCategory;
  _EditCategory._() : super._();

  @override
  TodoCategory? get initial;
  @override
  String? get name;
  @override
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$$_EditCategoryCopyWith<_$_EditCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
