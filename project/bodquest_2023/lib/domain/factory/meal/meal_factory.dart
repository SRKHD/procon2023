import '../../../infrastructure/model/firestore/meal/rug_meal.dart';
import '../../entity/meal.dart';

abstract interface class IMealFactory {
  /// [Meal]を生成する
  Meal create({
    required String userId,
    required String name,
    required DateTime date,
    required int timestamp,
    required int calorie,
  });

  /// [RugMeal]から[Meal]を生成する
  Meal createFromModel(RugMeal weight);
}
