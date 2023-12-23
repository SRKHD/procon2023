import '../../entity/meal.dart';

abstract interface class IGetMealsUsecase {
  Stream<List<Meal>> execute(String userId);
}
