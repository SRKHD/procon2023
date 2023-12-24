import '../../../domain/entity/meal.dart';
import '../../../domain/factory/meal/meal_factory.dart';
import '../../model/firestore/meal/fug_meal.dart';

class MealFactoryImpl implements IMealFactory {
  @override
  Meal create({
    required String userId,
    required String name,
    required DateTime date,
    required int timestamp,
    required int calorie,
  }) {
    return Meal(
      userId: userId,
      name: name,
      calorie: calorie,
      timestamp: timestamp,
      date: date,
    );
  }

  @override
  Meal createFromModel(FugMeal weight) {
    return Meal(
      userId: weight.userId,
      name: weight.name,
      date: weight.date,
      timestamp: weight.timestamp,
      calorie: weight.calorie,
    );
  }
}
