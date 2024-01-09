import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/value/meal_kind.dart';
import '../../notifier/meal/meal_kind_notifier.dart';
import '../../state/meal/meal_kind_state.dart';

final mealKindNotifierProvider =
    StateNotifierProvider.family<MealKindNotifier, MealKindState, MealKind>(
  (ref, value) {
    return MealKindNotifier(MealKindState(value: value));
  },
);
