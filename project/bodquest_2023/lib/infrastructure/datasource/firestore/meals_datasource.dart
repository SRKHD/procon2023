import '../../model/firestore/meal/fug_get_meals_response.dart';

abstract interface class IFirestoreMealsDataSource {
  Stream<FugGetMealsResponse> getMeals(String userId);
  Future<int> addMeal(String userId, String name, DateTime date, int calorie,
      String imageFilePath);
}
