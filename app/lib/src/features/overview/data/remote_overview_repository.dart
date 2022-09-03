import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../task_management/domain/todo_task.dart';
import '../weekly/domain/weekly_tasks.dart';

class RemoteOverviewRepository {
  final GraphQLClient _qlClient;
  RemoteOverviewRepository(this._qlClient);

  final _dateFormatter = DateFormat('yyyy-MM-dd');

  Stream<AsyncValue<List<TodoTask>>> subscribeTasksOnDate(DateTime date) {
    const query = '''subscription (\$date: date) {
      vm_tasks_on_date(where: {dueDate: {_eq: \$date}}) {
        __typename
        id
        userId
        title
        completed
        note
        categoryId
        categoryColor
        dueDatetime
        createdAt
        createdAt
        completedAt
        sub_tasks {
          __typename
          id
          title
          completed
          dueAt
          note
          userId
          taskId
          createdAt
          updatedAt
        }
      }
    }''';

    return _qlClient
        .subscribe(SubscriptionOptions(
      document: gql(query),
      variables: {'date': _dateFormatter.format(date)},
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ))
        .map((result) {
      if (result.isLoading) {
        return const AsyncLoading();
      }

      if (result.hasException) {
        return AsyncError(result.exception!);
      }

      if (result.data != null) {
        final tasks = result.data!['vm_tasks_on_date'] as List;
        return AsyncData(
          tasks.map((json) => TodoTask.fromJson(json)).toList(),
        );
      }
      return const AsyncData([]);
    });
  }

  Stream<AsyncValue<List<WeeklyTasks>>> subscribeTasksOnDateRange(
    DateTime from,
    DateTime to,
  ) {
    const query = '''subscription (\$from: date, \$to: date) {
      vm_tasks_on_date(where: {dueDate: {_lte: \$to, _gte: \$from}}, 
      order_by: {dueDate: asc}) {
        __typename
        id
        userId
        title
        completed
        note
        categoryId
        categoryColor
        dueDatetime
        createdAt
        createdAt
        completedAt
        sub_tasks {
          __typename
          id
          title
          completed
          dueAt
          note
          userId
          taskId
          createdAt
          updatedAt
        }
      }
    }''';

    return _qlClient
        .subscribe(SubscriptionOptions(
      document: gql(query),
      variables: {
        'from': _dateFormatter.format(from),
        'to': _dateFormatter.format(to),
      },
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    ))
        .map((result) {
      if (result.isLoading) {
        return const AsyncLoading();
      }

      if (result.hasException) {
        return AsyncError(result.exception!);
      }

      if (result.data != null) {
        final tasksData = result.data!['vm_tasks_on_date'] as List;
        final tasks = tasksData.map((json) => TodoTask.fromJson(json)).toList();
        List<WeeklyTasks> list = [];
        final map = <String, List<TodoTask>>{};
        for (var i = 0; i < to.difference(from).inDays; i++) {
          final date = _dateFormatter.format(from.add(Duration(days: i)));
          map[date] = [];
        }
        for (var task in tasks) {
          final date = _dateFormatter.format(task.dueDatetime);
          map[date] = [...map[date] ?? [], task];
        }

        for (var date in map.keys) {
          list.add(WeeklyTasks(date: date, tasks: map[date] ?? []));
        }
        return AsyncData(list);
      }
      return const AsyncData([]);
    });
  }
}
