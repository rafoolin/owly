// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditTask {
  TodoTask? get initialTask => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  DateTime? get dueDatetime => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  List<TodoSubTask> get addedSubTasks => throw _privateConstructorUsedError;
  List<TodoSubTask> get removedSubTasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTaskCopyWith<EditTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTaskCopyWith<$Res> {
  factory $EditTaskCopyWith(EditTask value, $Res Function(EditTask) then) =
      _$EditTaskCopyWithImpl<$Res>;
  $Res call(
      {TodoTask? initialTask,
      String? title,
      String? categoryId,
      DateTime? dueDatetime,
      String? note,
      List<TodoSubTask> addedSubTasks,
      List<TodoSubTask> removedSubTasks});

  $TodoTaskCopyWith<$Res>? get initialTask;
}

/// @nodoc
class _$EditTaskCopyWithImpl<$Res> implements $EditTaskCopyWith<$Res> {
  _$EditTaskCopyWithImpl(this._value, this._then);

  final EditTask _value;
  // ignore: unused_field
  final $Res Function(EditTask) _then;

  @override
  $Res call({
    Object? initialTask = freezed,
    Object? title = freezed,
    Object? categoryId = freezed,
    Object? dueDatetime = freezed,
    Object? note = freezed,
    Object? addedSubTasks = freezed,
    Object? removedSubTasks = freezed,
  }) {
    return _then(_value.copyWith(
      initialTask: initialTask == freezed
          ? _value.initialTask
          : initialTask // ignore: cast_nullable_to_non_nullable
              as TodoTask?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDatetime: dueDatetime == freezed
          ? _value.dueDatetime
          : dueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      addedSubTasks: addedSubTasks == freezed
          ? _value.addedSubTasks
          : addedSubTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
      removedSubTasks: removedSubTasks == freezed
          ? _value.removedSubTasks
          : removedSubTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
    ));
  }

  @override
  $TodoTaskCopyWith<$Res>? get initialTask {
    if (_value.initialTask == null) {
      return null;
    }

    return $TodoTaskCopyWith<$Res>(_value.initialTask!, (value) {
      return _then(_value.copyWith(initialTask: value));
    });
  }
}

/// @nodoc
abstract class _$$_EditTaskCopyWith<$Res> implements $EditTaskCopyWith<$Res> {
  factory _$$_EditTaskCopyWith(
          _$_EditTask value, $Res Function(_$_EditTask) then) =
      __$$_EditTaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {TodoTask? initialTask,
      String? title,
      String? categoryId,
      DateTime? dueDatetime,
      String? note,
      List<TodoSubTask> addedSubTasks,
      List<TodoSubTask> removedSubTasks});

  @override
  $TodoTaskCopyWith<$Res>? get initialTask;
}

/// @nodoc
class __$$_EditTaskCopyWithImpl<$Res> extends _$EditTaskCopyWithImpl<$Res>
    implements _$$_EditTaskCopyWith<$Res> {
  __$$_EditTaskCopyWithImpl(
      _$_EditTask _value, $Res Function(_$_EditTask) _then)
      : super(_value, (v) => _then(v as _$_EditTask));

  @override
  _$_EditTask get _value => super._value as _$_EditTask;

  @override
  $Res call({
    Object? initialTask = freezed,
    Object? title = freezed,
    Object? categoryId = freezed,
    Object? dueDatetime = freezed,
    Object? note = freezed,
    Object? addedSubTasks = freezed,
    Object? removedSubTasks = freezed,
  }) {
    return _then(_$_EditTask(
      initialTask: initialTask == freezed
          ? _value.initialTask
          : initialTask // ignore: cast_nullable_to_non_nullable
              as TodoTask?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDatetime: dueDatetime == freezed
          ? _value.dueDatetime
          : dueDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      addedSubTasks: addedSubTasks == freezed
          ? _value._addedSubTasks
          : addedSubTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
      removedSubTasks: removedSubTasks == freezed
          ? _value._removedSubTasks
          : removedSubTasks // ignore: cast_nullable_to_non_nullable
              as List<TodoSubTask>,
    ));
  }
}

/// @nodoc

class _$_EditTask extends _EditTask {
  _$_EditTask(
      {this.initialTask,
      this.title,
      this.categoryId,
      this.dueDatetime,
      this.note,
      final List<TodoSubTask> addedSubTasks = const [],
      final List<TodoSubTask> removedSubTasks = const []})
      : _addedSubTasks = addedSubTasks,
        _removedSubTasks = removedSubTasks,
        super._();

  @override
  final TodoTask? initialTask;
  @override
  final String? title;
  @override
  final String? categoryId;
  @override
  final DateTime? dueDatetime;
  @override
  final String? note;
  final List<TodoSubTask> _addedSubTasks;
  @override
  @JsonKey()
  List<TodoSubTask> get addedSubTasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedSubTasks);
  }

  final List<TodoSubTask> _removedSubTasks;
  @override
  @JsonKey()
  List<TodoSubTask> get removedSubTasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removedSubTasks);
  }

  @override
  String toString() {
    return 'EditTask(initialTask: $initialTask, title: $title, categoryId: $categoryId, dueDatetime: $dueDatetime, note: $note, addedSubTasks: $addedSubTasks, removedSubTasks: $removedSubTasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditTask &&
            const DeepCollectionEquality()
                .equals(other.initialTask, initialTask) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.dueDatetime, dueDatetime) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality()
                .equals(other._addedSubTasks, _addedSubTasks) &&
            const DeepCollectionEquality()
                .equals(other._removedSubTasks, _removedSubTasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialTask),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(dueDatetime),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(_addedSubTasks),
      const DeepCollectionEquality().hash(_removedSubTasks));

  @JsonKey(ignore: true)
  @override
  _$$_EditTaskCopyWith<_$_EditTask> get copyWith =>
      __$$_EditTaskCopyWithImpl<_$_EditTask>(this, _$identity);
}

abstract class _EditTask extends EditTask {
  factory _EditTask(
      {final TodoTask? initialTask,
      final String? title,
      final String? categoryId,
      final DateTime? dueDatetime,
      final String? note,
      final List<TodoSubTask> addedSubTasks,
      final List<TodoSubTask> removedSubTasks}) = _$_EditTask;
  _EditTask._() : super._();

  @override
  TodoTask? get initialTask;
  @override
  String? get title;
  @override
  String? get categoryId;
  @override
  DateTime? get dueDatetime;
  @override
  String? get note;
  @override
  List<TodoSubTask> get addedSubTasks;
  @override
  List<TodoSubTask> get removedSubTasks;
  @override
  @JsonKey(ignore: true)
  _$$_EditTaskCopyWith<_$_EditTask> get copyWith =>
      throw _privateConstructorUsedError;
}
