import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final dateFormatProvider =
    Provider<DateFormat>((_) => DateFormat('EEE, MMM d, yyyy'));
final abrMonthDayFormatProvider =
    Provider<DateFormat>((_) => DateFormat.MMMd());

final dashedDateFormatProvider = Provider<DateFormat>(
  (_) => DateFormat('yyyy-MM-dd'),
);
