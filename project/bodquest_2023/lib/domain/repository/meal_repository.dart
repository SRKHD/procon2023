import '../entity/meal.dart';

abstract interface class IMealRepository {
  /// ユーザー一覧の取得
  Stream<List<Meal>> findAll(String userId);
  Future<int> addMeal(
    String userId,
    String name,
    DateTime date,
    int calorie,
    String imageURL,
  );
}
