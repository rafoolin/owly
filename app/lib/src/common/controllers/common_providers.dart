import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final dateFormatProvider = Provider<DateFormat>((_) => DateFormat.yMMMMEEEEd());
final abrMonthDayFormatProvider =
    Provider<DateFormat>((_) => DateFormat.MMMd());

final dashedDateFormatProvider = Provider<DateFormat>(
  (_) => DateFormat('yyyy-MM-dd'),
);
