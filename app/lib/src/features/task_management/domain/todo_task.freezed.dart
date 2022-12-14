// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoTask _$TodoTaskFromJson(Map<String, dynamic> json) {
  return _TodoTask.fromJson(json);
}

/// @nodoc
mixin _$TodoTask {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get dueDatetime => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  int? get indexValue => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @ColorConverter()
  Color? get categoryColor => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_tasks')
  List<TodoSubTask> get subTasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoTaskCopyWith<TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoTaskCopyWith<$Res> {
  factory $TodoTaskCopyWith(TodoTask value, $Res Function(TodoTask) then) =
      _$TodoTaskCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String userId,
      String categoryId,
      DateTime createdAt,
      DateTime dueDatetime,
      bool completed,
      String? note,
      int? indexValue,
      DateTime? updatedAt,
      @ColorConverter() Color? categoryColor,
      DateTime? completedAt,
      @JsonKey(name: 'sub_tasks') List<TodoSubTask> subTasks});
}

/// @nodoc
class _$TodoTaskCopyWithImpl<$Res> implements $TodoTaskCopyWith<$Res> {
  _$TodoTaskCopyWithImpl(this._value, this._then);

  final TodoTask _value;
  // ignore: unused_field
  final $Res Function(TodoTask) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userId = freezed,
    Object? categoryId = freezed,
    Object? createdAt = freezed,
    Object? dueDatetime = freezed,
    Object? completed = freezed,
    Object? note = freezed,
    Object? indexValue = freezed,
    Object? updatedAt = freezed,
    Object? categoryColor = freezed,
    Object? completedAt = freezed,
    Object? subTasks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDatetime: dueDatetime == freezed
          ? _value.dueDatetime
          : dueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      indexValue: indexValue == freezed
          ? _value.indexValue
          : indexValue // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryColor: categoryColor == freezed
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      completedAt: completedAt == freezed
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subTasks: subTasks == freezed
          ? _value.subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoTaskCopyWith<$Res> implements $TodoTaskCopyWith<$Res> {
  factory _$$_TodoTaskCopyWith(
          _$_TodoTask value, $Res Function(_$_TodoTask) then) =
      __$$_TodoTaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String userId,
      String categoryId,
      DateTime createdAt,
      DateTime dueDatetime,
      bool completed,
      String? note,
      int? indexValue,
      DateTime? updatedAt,
      @ColorConverter() Color? categoryColor,
      DateTime? completedAt,
      @JsonKey(name: 'sub_tasks') List<TodoSubTask> subTasks});
}

/// @nodoc
class __$$_TodoTaskCopyWithImpl<$Res> extends _$TodoTaskCopyWithImpl<$Res>
    implements _$$_TodoTaskCopyWith<$Res> {
  __$$_TodoTaskCopyWithImpl(
      _$_TodoTask _value, $Res Function(_$_TodoTask) _then)
      : super(_value, (v) => _then(v as _$_TodoTask));

  @override
  _$_TodoTask get _value => super._value as _$_TodoTask;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userId = freezed,
    Object? categoryId = freezed,
    Object? createdAt = freezed,
    Object? dueDatetime = freezed,
    Object? completed = freezed,
    Object? note = freezed,
    Object? indexValue = freezed,
    Object? updatedAt = freezed,
    Object? categoryColor = freezed,
    Object? completedAt = freezed,
    Object? subTasks = freezed,
  }) {
    return _then(_$_TodoTask(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDatetime: dueDatetime == freezed
          ? _value.dueDatetime
          : dueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      indexValue: indexValue == freezed
          ? _value.indexValue
          : indexValue // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryColor: categoryColor == freezed
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      completedAt: completedAt == freezed
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subTasks: subTasks == freezed
          ? _value._subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoTask extends _TodoTask with DiagnosticableTreeMixin {
  _$_TodoTask(
      {required this.id,
      required this.title,
      required this.userId,
      required this.categoryId,
      required this.createdAt,
      required this.dueDatetime,
      this.completed = false,
      this.note,
      this.indexValue,
      this.updatedAt,
      @ColorConverter() this.categoryColor,
      this.completedAt,
      @JsonKey(name: 'sub_tasks') final List<TodoSubTask> subTasks = const []})
      : _subTasks = subTasks,
        super._();

  factory _$_TodoTask.fromJson(Map<String, dynamic> json) =>
      _$$_TodoTaskFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String userId;
  @override
  final String categoryId;
  @override
  final DateTime createdAt;
  @override
  final DateTime dueDatetime;
  @override
  @JsonKey()
  final bool completed;
  @override
  final String? note;
  @override
  final int? indexValue;
  @override
  final DateTime? updatedAt;
  @override
  @ColorConverter()
  final Color? categoryColor;
  @override
  final DateTime? completedAt;
  final List<TodoSubTask> _subTasks;
  @override
  @JsonKey(name: 'sub_tasks')
  List<TodoSubTask> get subTasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subTasks);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoTask(id: $id, title: $title, userId: $userId, categoryId: $categoryId, createdAt: $createdAt, dueDatetime: $dueDatetime, completed: $completed, note: $note, indexValue: $indexValue, updatedAt: $updatedAt, categoryColor: $categoryColor, completedAt: $completedAt, subTasks: $subTasks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoTask'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('dueDatetime', dueDatetime))
      ..add(DiagnosticsProperty('completed', completed))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('indexValue', indexValue))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('categoryColor', categoryColor))
      ..add(DiagnosticsProperty('completedAt', completedAt))
      ..add(DiagnosticsProperty('subTasks', subTasks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoTask &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.dueDatetime, dueDatetime) &&
            const DeepCollectionEquality().equals(other.completed, completed) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality()
                .equals(other.indexValue, indexValue) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.categoryColor, categoryColor) &&
            const DeepCollectionEquality()
                .equals(other.completedAt, completedAt) &&
            const DeepCollectionEquality().equals(other._subTasks, _subTasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(dueDatetime),
      const DeepCollectionEquality().hash(completed),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(indexValue),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(categoryColor),
      const DeepCollectionEquality().hash(completedAt),
      const DeepCollectionEquality().hash(_subTasks));

  @JsonKey(ignore: true)
  @override
  _$$_TodoTaskCopyWith<_$_TodoTask> get copyWith =>
      __$$_TodoTaskCopyWithImpl<_$_TodoTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoTaskToJson(
      this,
    );
  }
}

abstract class _TodoTask extends TodoTask {
  factory _TodoTask(
          {required final String id,
          required final String title,
          required final String userId,
          required final String categoryId,
          required final DateTime createdAt,
          required final DateTime dueDatetime,
          final bool completed,
          final String? note,
          final int? indexValue,
          final DateTime? updatedAt,
          @ColorConverter() final Color? categoryColor,
          final DateTime? completedAt,
          @JsonKey(name: 'sub_tasks') final List<TodoSubTask> subTasks}) =
      _$_TodoTask;
  _TodoTask._() : super._();

  factory _TodoTask.fromJson(Map<String, dynamic> json) = _$_TodoTask.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get userId;
  @override
  String get categoryId;
  @override
  DateTime get createdAt;
  @override
  DateTime get dueDatetime;
  @override
  bool get completed;
  @override
  String? get note;
  @override
  int? get indexValue;
  @override
  DateTime? get updatedAt;
  @override
  @ColorConverter()
  Color? get categoryColor;
  @override
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'sub_tasks')
  List<TodoSubTask> get subTasks;
  @override
  @JsonKey(ignore: true)
  _$$_TodoTaskCopyWith<_$_TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}
