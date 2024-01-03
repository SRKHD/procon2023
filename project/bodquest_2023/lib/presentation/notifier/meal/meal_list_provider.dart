import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/meal/meal_state.dart';
import '../../usecaese_provider_module.dart';
import 'meal_list_notifier.dart';

final mealListNotifierProvider =
    StateNotifierProvider<MealListNotifier, AsyncValue<List<MealState>>>(
  (ref) => MealListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getUsecase: ref.read(getMealsUsecaseProvider),
    addUsecase: ref.read(addMealUsecaseProvider),
    deleteUsecase: ref.read(deleteMealUsecaseProvider),
    updateUsecase: ref.read(updateMealUsecaseProvider),
  ),
);
