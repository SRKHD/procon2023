import '../../../infrastructure/model/firestore/meal/fug_meal.dart';
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

  /// [FugMeal]から[Meal]を生成する
  Meal createFromModel(FugMeal weight);
}
