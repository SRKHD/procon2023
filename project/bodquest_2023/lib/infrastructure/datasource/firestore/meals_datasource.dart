import '../../model/firestore/meal/rug_get_meals_response.dart';

abstract interface class IFirestoreMealsDataSource {
  Stream<RugGetMealsResponse> getMeals(String userId);
  Future<int> addMeal(String userId, String name, DateTime date, int value);
}
