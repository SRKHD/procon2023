import '../entity/meal.dart';

abstract interface class IMealRepository {
  Stream<List<Meal>> get(String userId);

  Future<int> add(
    String userId,
    String kind,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  );

  Future<int> delete(
    String userId,
    String id,
  );

  Future<int> update(
    String userId,
    String id,
    String kind,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  );
}
