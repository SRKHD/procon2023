import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/datetime_notifier.dart';
import '../state/datetime_state.dart';

final datetimeNotifierProvider =
    StateNotifierProvider.family<DateTimeNotifier, DateTimeState, DateTime>(
  (ref, value) {
    return DateTimeNotifier(DateTimeState(value: value));
  },
);
