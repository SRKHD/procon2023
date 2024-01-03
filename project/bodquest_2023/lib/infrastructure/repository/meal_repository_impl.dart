import '../../domain/entity/meal.dart';
import '../../domain/factory/meal/meal_factory.dart';
import '../../domain/repository/meal_repository.dart';
import '../datasource/interface/firebase_storage/storage_datasource.dart';
import '../datasource/interface/firestore/meals_datasource.dart';

class MealRepositoryImpl implements IMealRepository {
  MealRepositoryImpl({
    required IFirestoreMealsDataSource dataSource,
    required IFirebaseStorageDataSource dataStorage,
    required IMealFactory factory,
  })  : fireStoreDataSource = dataSource,
        firebaseStorageSource = dataStorage,
        weightFactory = factory;
  final IFirestoreMealsDataSource fireStoreDataSource;
  final IFirebaseStorageDataSource firebaseStorageSource;
  final IMealFactory weightFactory;

  @override
  Stream<List<Meal>> get(String userId) {
    try {
      return fireStoreDataSource.getMeals(userId).asyncMap((response) =>
          Future.wait(response.results
              .map((result) => weightFactory.createFromModel(result))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> add(String userId, String name, DateTime date, int calorie,
      String imageFilePath) {
    final storagePath = '${userId}_${name}_image';
    if (imageFilePath != '') {
      firebaseStorageSource.addFile(storagePath, imageFilePath);
    }

    return fireStoreDataSource.add(userId, name, date, calorie, storagePath);
  }

  @override
  Future<int> delete(String userId, String id) {
    return fireStoreDataSource.delete(userId, id);
  }

  @override
  Future<int> update(String userId, String id, String name, DateTime date,
      int calorie, String imageFilePath) {
    final storagePath = '${userId}_${name}_image';
    if (imageFilePath != '') {
      firebaseStorageSource.addFile(storagePath, imageFilePath);
    }
    return fireStoreDataSource.update(
        userId, id, name, date, calorie, imageFilePath);
  }
}
