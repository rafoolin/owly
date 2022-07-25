// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskCategory _$TaskCategoryFromJson(Map<String, dynamic> json) {
  return _TaskCategory.fromJson(json);
}

/// @nodoc
mixin _$TaskCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @ColorConverter()
  Color? get color => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCategoryCopyWith<TaskCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCategoryCopyWith<$Res> {
  factory $TaskCategoryCopyWith(
          TaskCategory value, $Res Function(TaskCategory) then) =
      _$TaskCategoryCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String userId,
      @ColorConverter() Color? color,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TaskCategoryCopyWithImpl<$Res> implements $TaskCategoryCopyWith<$Res> {
  _$TaskCategoryCopyWithImpl(this._value, this._then);

  final TaskCategory _value;
  // ignore: unused_field
  final $Res Function(TaskCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskCategoryCopyWith<$Res>
    implements $TaskCategoryCopyWith<$Res> {
  factory _$$_TaskCategoryCopyWith(
          _$_TaskCategory value, $Res Function(_$_TaskCategory) then) =
      __$$_TaskCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String userId,
      @ColorConverter() Color? color,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_TaskCategoryCopyWithImpl<$Res>
    extends _$TaskCategoryCopyWithImpl<$Res>
    implements _$$_TaskCategoryCopyWith<$Res> {
  __$$_TaskCategoryCopyWithImpl(
      _$_TaskCategory _value, $Res Function(_$_TaskCategory) _then)
      : super(_value, (v) => _then(v as _$_TaskCategory));

  @override
  _$_TaskCategory get _value => super._value as _$_TaskCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_TaskCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskCategory extends _TaskCategory with DiagnosticableTreeMixin {
  _$_TaskCategory(
      {required this.id,
      required this.name,
      required this.userId,
      @ColorConverter() this.color,
      required this.createdAt,
      this.updatedAt})
      : super._();

  factory _$_TaskCategory.fromJson(Map<String, dynamic> json) =>
      _$$_TaskCategoryFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String userId;
  @override
  @ColorConverter()
  final Color? color;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskCategory(id: $id, name: $name, userId: $userId, color: $color, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskCategory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCategoryCopyWith<_$_TaskCategory> get copyWith =>
      __$$_TaskCategoryCopyWithImpl<_$_TaskCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskCategoryToJson(
      this,
    );
  }
}

abstract class _TaskCategory extends TaskCategory {
  factory _TaskCategory(
      {required final String id,
      required final String name,
      required final String userId,
      @ColorConverter() final Color? color,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$_TaskCategory;
  _TaskCategory._() : super._();

  factory _TaskCategory.fromJson(Map<String, dynamic> json) =
      _$_TaskCategory.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get userId;
  @override
  @ColorConverter()
  Color? get color;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCategoryCopyWith<_$_TaskCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
