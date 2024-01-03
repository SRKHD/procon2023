import '../../../model/firestore/meal/fug_get_meals_response.dart';

abstract interface class IFirestoreMealsDataSource {
  Stream<FugGetMealsResponse> getMeals(String userId);
  Future<int> add(String userId, String name, DateTime date, int calorie,
      String imageFilePath);
  Future<int> delete(String userId, String id);
  Future<int> update(String userId, String id, String name, DateTime date,
      int calorie, String imageFilePath);
}
