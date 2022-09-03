// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weekly_tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeeklyTasks {
  String get date => throw _privateConstructorUsedError;
  List<TodoTask> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeeklyTasksCopyWith<WeeklyTasks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyTasksCopyWith<$Res> {
  factory $WeeklyTasksCopyWith(
          WeeklyTasks value, $Res Function(WeeklyTasks) then) =
      _$WeeklyTasksCopyWithImpl<$Res>;
  $Res call({String date, List<TodoTask> tasks});
}

/// @nodoc
class _$WeeklyTasksCopyWithImpl<$Res> implements $WeeklyTasksCopyWith<$Res> {
  _$WeeklyTasksCopyWithImpl(this._value, this._then);

  final WeeklyTasks _value;
  // ignore: unused_field
  final $Res Function(WeeklyTasks) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TodoTask>,
    ));
  }
}

/// @nodoc
abstract class _$$_WeeklyTasksCopyWith<$Res>
    implements $WeeklyTasksCopyWith<$Res> {
  factory _$$_WeeklyTasksCopyWith(
          _$_WeeklyTasks value, $Res Function(_$_WeeklyTasks) then) =
      __$$_WeeklyTasksCopyWithImpl<$Res>;
  @override
  $Res call({String date, List<TodoTask> tasks});
}

/// @nodoc
class __$$_WeeklyTasksCopyWithImpl<$Res> extends _$WeeklyTasksCopyWithImpl<$Res>
    implements _$$_WeeklyTasksCopyWith<$Res> {
  __$$_WeeklyTasksCopyWithImpl(
      _$_WeeklyTasks _value, $Res Function(_$_WeeklyTasks) _then)
      : super(_value, (v) => _then(v as _$_WeeklyTasks));

  @override
  _$_WeeklyTasks get _value => super._value as _$_WeeklyTasks;

  @override
  $Res call({
    Object? date = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_$_WeeklyTasks(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TodoTask>,
    ));
  }
}

/// @nodoc

class _$_WeeklyTasks extends _WeeklyTasks {
  _$_WeeklyTasks({required this.date, final List<TodoTask> tasks = const []})
      : _tasks = tasks,
        super._();

  @override
  final String date;
  final List<TodoTask> _tasks;
  @override
  @JsonKey()
  List<TodoTask> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'WeeklyTasks(date: $date, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeeklyTasks &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  _$$_WeeklyTasksCopyWith<_$_WeeklyTasks> get copyWith =>
      __$$_WeeklyTasksCopyWithImpl<_$_WeeklyTasks>(this, _$identity);
}

abstract class _WeeklyTasks extends WeeklyTasks {
  factory _WeeklyTasks(
      {required final String date,
      final List<TodoTask> tasks}) = _$_WeeklyTasks;
  _WeeklyTasks._() : super._();

  @override
  String get date;
  @override
  List<TodoTask> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_WeeklyTasksCopyWith<_$_WeeklyTasks> get copyWith =>
      throw _privateConstructorUsedError;
}
