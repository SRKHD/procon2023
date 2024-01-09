import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/meal/meal_kind_state.dart';

class MealKindNotifier extends StateNotifier<MealKindState> {
  MealKindNotifier(
    super.initValue,
  );

  /// 現在の状態
  MealKindState get value => state;

  void update(MealKindState value) {
    state = value;
  }
}
