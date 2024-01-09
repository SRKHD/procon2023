import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/meal/meal_register_kind_state.dart';

class MealRegisterKindNotifier extends StateNotifier<MealRegisterKindState> {
  MealRegisterKindNotifier(
    super.initValue,
  );

  /// 現在の状態
  MealRegisterKindState get value => state;

  void update(MealRegisterKindState value) {
    state = value;
  }
}
