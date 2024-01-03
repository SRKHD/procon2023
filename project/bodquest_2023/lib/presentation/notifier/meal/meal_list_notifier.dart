import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/meal/add_meal_usecase.dart';
import '../../../domain/usecase/meal/delete_meal_usecase.dart';
import '../../../domain/usecase/meal/get_meals_usecase.dart';
import '../../../domain/usecase/meal/update_meal_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../state/meal/meal_state.dart';

class MealListNotifier extends StateNotifier<AsyncValue<List<MealState>>> {
  MealListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetMealsUsecase getUsecase,
    required IAddMealUsecase addUsecase,
    required IDeleteMealUsecase deleteUsecase,
    required IUpdateMealUsecase updateUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getUsecase = getUsecase,
        _addUsecase = addUsecase,
        _deleteUsecase = deleteUsecase,
        _updateUsecase = updateUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetMealsUsecase _getUsecase;
  final IAddMealUsecase _addUsecase;
  final IDeleteMealUsecase _deleteUsecase;
  final IUpdateMealUsecase _updateUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getUsecase.execute(userId).listen((values) {
      state = AsyncValue.data(
          values.map((weight) => MealState.fromEntity(weight)).toList());
    }).onError((e) => print(e));
  }

  void add(
    String userId,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  ) {
    _addUsecase.execute(userId, name, date, calorie, imageFilePath);
  }

  void delete(
    String userId,
    String id,
  ) {
    _deleteUsecase.execute(userId, id);
  }

  void update(
    String userId,
    String id,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  ) {
    _updateUsecase.execute(userId, id, name, date, calorie, imageFilePath);
  }
}
