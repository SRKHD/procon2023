import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/datetime_state.dart';

class DateTimeNotifier extends StateNotifier<DateTimeState> {
  DateTimeNotifier(
    super.initValue,
  );

  /// 現在の状態
  DateTimeState get value => state;

  void update(DateTimeState value) {
    state = value;
  }
}
