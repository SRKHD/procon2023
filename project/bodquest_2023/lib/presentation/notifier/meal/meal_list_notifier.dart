import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/meal/add_meal_usecase.dart';
import '../../../domain/usecase/meal/get_meals_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../state/meal/meal_state.dart';

class MealListNotifier extends StateNotifier<AsyncValue<List<MealState>>> {
  MealListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetMealsUsecase getMealsUsecase,
    required IAddMealUsecase addMealUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getMealsUsecase = getMealsUsecase,
        _addMealsUsecase = addMealUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetMealsUsecase _getMealsUsecase;
  final IAddMealUsecase _addMealsUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getMealsUsecase.execute(userId).listen((weights) {
      state = AsyncValue.data(
          weights.map((weight) => MealState.fromEntity(weight)).toList());
    }).onError((e) => print(e));
  }

  void addMeal(
    String userId,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  ) {
    _addMealsUsecase.execute(userId, name, date, calorie, imageFilePath);
  }
}
