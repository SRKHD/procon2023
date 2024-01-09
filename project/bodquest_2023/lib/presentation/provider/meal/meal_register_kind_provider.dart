import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/value/meal_register_kind.dart';
import '../../notifier/meal/meal_register_kind_notifier.dart';
import '../../state/meal/meal_register_kind_state.dart';

final mealRegisterKindNotifierProvider = StateNotifierProvider.family<
    MealRegisterKindNotifier, MealRegisterKindState, MealRegisterKind>(
  (ref, value) {
    return MealRegisterKindNotifier(MealRegisterKindState(value: value));
  },
);
