import '../../domain/entity/meal.dart';
import '../../domain/factory/meal/meal_factory.dart';
import '../../domain/repository/meal_repository.dart';
import '../datasource/firestore/meals_datasource.dart';

class MealRepositoryImpl implements IMealRepository {
  MealRepositoryImpl({
    required IFirestoreMealsDataSource dataSource,
    required IMealFactory factory,
  })  : fireStoreDataSource = dataSource,
        weightFactory = factory;
  final IFirestoreMealsDataSource fireStoreDataSource;
  final IMealFactory weightFactory;

  @override
  Stream<List<Meal>> findAll(String userId) {
    try {
      return fireStoreDataSource.getMeals(userId).map((event) =>
          [...event.results.map((res) => weightFactory.createFromModel(res))]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addMeal(
      String userId, String name, DateTime date, int calorie, String imageURL) {
    return fireStoreDataSource.addMeal(userId, name, date, calorie, imageURL);
  }
}
