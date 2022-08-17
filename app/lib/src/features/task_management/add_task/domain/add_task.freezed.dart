// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddTask {
  String? get title => throw _privateConstructorUsedError;
  String? get initialCategoryId => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  DateTime? get initialDueDatetime => throw _privateConstructorUsedError;
  DateTime? get dueDatetime => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  List<TodoSubTask> get subTasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTaskCopyWith<AddTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTaskCopyWith<$Res> {
  factory $AddTaskCopyWith(AddTask value, $Res Function(AddTask) then) =
      _$AddTaskCopyWithImpl<$Res>;
  $Res call(
      {String? title,
      String? initialCategoryId,
      String? categoryId,
      DateTime? initialDueDatetime,
      DateTime? dueDatetime,
      String? note,
      List<TodoSubTask> subTasks});
}

/// @nodoc
class _$AddTaskCopyWithImpl<$Res> implements $AddTaskCopyWith<$Res> {
  _$AddTaskCopyWithImpl(this._value, this._then);

  final AddTask _value;
  // ignore: unused_field
  final $Res Function(AddTask) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? initialCategoryId = freezed,
    Object? categoryId = freezed,
    Object? initialDueDatetime = freezed,
    Object? dueDatetime = freezed,
    Object? note = freezed,
    Object? subTasks = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      initialCategoryId: initialCategoryId == freezed
          ? _value.initialCategoryId
          : initialCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      initialDueDatetime: initialDueDatetime == freezed
          ? _value.initialDueDatetime
          : initialDueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dueDatetime: dueDatetime == freezed
          ? _value.dueDatetime
          : dueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      subTasks: subTasks == freezed
          ? _value.subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
    ));
  }
}

/// @nodoc
abstract class _$$_AddTaskCopyWith<$Res> implements $AddTaskCopyWith<$Res> {
  factory _$$_AddTaskCopyWith(
          _$_AddTask value, $Res Function(_$_AddTask) then) =
      __$$_AddTaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? title,
      String? initialCategoryId,
      String? categoryId,
      DateTime? initialDueDatetime,
      DateTime? dueDatetime,
      String? note,
      List<TodoSubTask> subTasks});
}

/// @nodoc
class __$$_AddTaskCopyWithImpl<$Res> extends _$AddTaskCopyWithImpl<$Res>
    implements _$$_AddTaskCopyWith<$Res> {
  __$$_AddTaskCopyWithImpl(_$_AddTask _value, $Res Function(_$_AddTask) _then)
      : super(_value, (v) => _then(v as _$_AddTask));

  @override
  _$_AddTask get _value => super._value as _$_AddTask;

  @override
  $Res call({
    Object? title = freezed,
    Object? initialCategoryId = freezed,
    Object? categoryId = freezed,
    Object? initialDueDatetime = freezed,
    Object? dueDatetime = freezed,
    Object? note = freezed,
    Object? subTasks = freezed,
  }) {
    return _then(_$_AddTask(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      initialCategoryId: initialCategoryId == freezed
          ? _value.initialCategoryId
          : initialCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      initialDueDatetime: initialDueDatetime == freezed
          ? _value.initialDueDatetime
          : initialDueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dueDatetime: dueDatetime == freezed
          ? _value.dueDatetime
          : dueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      subTasks: subTasks == freezed
          ? _value._subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
    ));
  }
}

/// @nodoc

class _$_AddTask extends _AddTask {
  _$_AddTask(
      {this.title,
      this.initialCategoryId,
      this.categoryId,
      this.initialDueDatetime,
      this.dueDatetime,
      this.note,
      final List<TodoSubTask> subTasks = const []})
      : _subTasks = subTasks,
        super._();

  @override
  final String? title;
  @override
  final String? initialCategoryId;
  @override
  final String? categoryId;
  @override
  final DateTime? initialDueDatetime;
  @override
  final DateTime? dueDatetime;
  @override
  final String? note;
  final List<TodoSubTask> _subTasks;
  @override
  @JsonKey()
  List<TodoSubTask> get subTasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subTasks);
  }

  @override
  String toString() {
    return 'AddTask(title: $title, initialCategoryId: $initialCategoryId, categoryId: $categoryId, initialDueDatetime: $initialDueDatetime, dueDatetime: $dueDatetime, note: $note, subTasks: $subTasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTask &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.initialCategoryId, initialCategoryId) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.initialDueDatetime, initialDueDatetime) &&
            const DeepCollectionEquality()
                .equals(other.dueDatetime, dueDatetime) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other._subTasks, _subTasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(initialCategoryId),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(initialDueDatetime),
      const DeepCollectionEquality().hash(dueDatetime),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(_subTasks));

  @JsonKey(ignore: true)
  @override
  _$$_AddTaskCopyWith<_$_AddTask> get copyWith =>
      __$$_AddTaskCopyWithImpl<_$_AddTask>(this, _$identity);
}

abstract class _AddTask extends AddTask {
  factory _AddTask(
      {final String? title,
      final String? initialCategoryId,
      final String? categoryId,
      final DateTime? initialDueDatetime,
      final DateTime? dueDatetime,
      final String? note,
      final List<TodoSubTask> subTasks}) = _$_AddTask;
  _AddTask._() : super._();

  @override
  String? get title;
  @override
  String? get initialCategoryId;
  @override
  String? get categoryId;
  @override
  DateTime? get initialDueDatetime;
  @override
  DateTime? get dueDatetime;
  @override
  String? get note;
  @override
  List<TodoSubTask> get subTasks;
  @override
  @JsonKey(ignore: true)
  _$$_AddTaskCopyWith<_$_AddTask> get copyWith =>
      throw _privateConstructorUsedError;
}
