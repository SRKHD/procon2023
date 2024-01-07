import '../../../domain/factory/meal/meal_kind_factory.dart';
import '../../../domain/value/meal_kind.dart';
import '../../model/firestore/meal/fug_meal_kind.dart';

class MealKindFactoryImpl implements IMealKindFactory {
  @override
  MealKind create(String value) {
    switch (value) {
      case 'breakfast':
        return MealKind.breakfast;
      case 'lunch':
        return MealKind.lunch;
      case 'dinner':
        return MealKind.dinner;
      case 'snack':
        return MealKind.snack;
      default:
        throw ArgumentError();
    }
  }

  @override
  MealKind createFromModel(FugMealKind gender) {
    switch (gender) {
      case FugMealKind.lunch:
        return MealKind.lunch;
      case FugMealKind.dinner:
        return MealKind.dinner;
      case FugMealKind.snack:
        return MealKind.snack;
      default:
        return MealKind.breakfast;
    }
  }
}
