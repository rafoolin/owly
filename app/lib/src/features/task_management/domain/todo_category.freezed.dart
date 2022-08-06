// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoCategory _$TodoCategoryFromJson(Map<String, dynamic> json) {
  return _TodoCategory.fromJson(json);
}

/// @nodoc
mixin _$TodoCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @ColorConverter()
  Color? get color => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get totalTasks => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCategoryCopyWith<TodoCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCategoryCopyWith<$Res> {
  factory $TodoCategoryCopyWith(
          TodoCategory value, $Res Function(TodoCategory) then) =
      _$TodoCategoryCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String userId,
      @ColorConverter() Color? color,
      DateTime createdAt,
      int totalTasks,
      DateTime? updatedAt});
}

/// @nodoc
class _$TodoCategoryCopyWithImpl<$Res> implements $TodoCategoryCopyWith<$Res> {
  _$TodoCategoryCopyWithImpl(this._value, this._then);

  final TodoCategory _value;
  // ignore: unused_field
  final $Res Function(TodoCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? totalTasks = freezed,
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
      totalTasks: totalTasks == freezed
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoCategoryCopyWith<$Res>
    implements $TodoCategoryCopyWith<$Res> {
  factory _$$_TodoCategoryCopyWith(
          _$_TodoCategory value, $Res Function(_$_TodoCategory) then) =
      __$$_TodoCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String userId,
      @ColorConverter() Color? color,
      DateTime createdAt,
      int totalTasks,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_TodoCategoryCopyWithImpl<$Res>
    extends _$TodoCategoryCopyWithImpl<$Res>
    implements _$$_TodoCategoryCopyWith<$Res> {
  __$$_TodoCategoryCopyWithImpl(
      _$_TodoCategory _value, $Res Function(_$_TodoCategory) _then)
      : super(_value, (v) => _then(v as _$_TodoCategory));

  @override
  _$_TodoCategory get _value => super._value as _$_TodoCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? totalTasks = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_TodoCategory(
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
      totalTasks: totalTasks == freezed
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoCategory extends _TodoCategory with DiagnosticableTreeMixin {
  _$_TodoCategory(
      {required this.id,
      required this.name,
      required this.userId,
      @ColorConverter() this.color,
      required this.createdAt,
      required this.totalTasks,
      this.updatedAt})
      : super._();

  factory _$_TodoCategory.fromJson(Map<String, dynamic> json) =>
      _$$_TodoCategoryFromJson(json);

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
  final int totalTasks;
  @override
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoCategory(id: $id, name: $name, userId: $userId, color: $color, createdAt: $createdAt, totalTasks: $totalTasks, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoCategory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('totalTasks', totalTasks))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.totalTasks, totalTasks) &&
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
      const DeepCollectionEquality().hash(totalTasks),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_TodoCategoryCopyWith<_$_TodoCategory> get copyWith =>
      __$$_TodoCategoryCopyWithImpl<_$_TodoCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoCategoryToJson(
      this,
    );
  }
}

abstract class _TodoCategory extends TodoCategory {
  factory _TodoCategory(
      {required final String id,
      required final String name,
      required final String userId,
      @ColorConverter() final Color? color,
      required final DateTime createdAt,
      required final int totalTasks,
      final DateTime? updatedAt}) = _$_TodoCategory;
  _TodoCategory._() : super._();

  factory _TodoCategory.fromJson(Map<String, dynamic> json) =
      _$_TodoCategory.fromJson;

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
  int get totalTasks;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCategoryCopyWith<_$_TodoCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
