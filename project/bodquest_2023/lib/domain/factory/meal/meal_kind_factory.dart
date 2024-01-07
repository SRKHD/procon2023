import '../../../infrastructure/model/firestore/meal/fug_meal_kind.dart';
import '../../value/meal_kind.dart';

abstract interface class IMealKindFactory {
  /// [MealKind]を生成する
  MealKind create(String value);

  /// [FugUserGender]から[UserGender]を生成する
  MealKind createFromModel(FugMealKind kind);
}
