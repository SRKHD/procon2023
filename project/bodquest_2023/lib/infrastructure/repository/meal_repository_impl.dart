import 'dart:typed_data';

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
        mealFactory = factory;
  final IFirestoreMealsDataSource fireStoreDataSource;
  final IFirebaseStorageDataSource firebaseStorageSource;
  final IMealFactory mealFactory;

  @override
  Stream<List<Meal>> get(String userId) {
    try {
      return fireStoreDataSource.getMeals(userId).asyncMap((response) =>
          Future.wait(response.results
              .map((result) => mealFactory.createFromModel(result))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> add(String userId, String kind, String name, DateTime date,
      int calorie, Uint8List? imageData) async {
    final storagePath = '${userId}_${name}_image';
    String imagePath = '';
    if (imageData != null) {
      imagePath = await firebaseStorageSource.addFile(storagePath, imageData);
    }

    return fireStoreDataSource.add(
        userId, kind, name, date, calorie, imagePath);
  }

  @override
  Future<int> delete(String userId, String id) {
    return fireStoreDataSource.delete(userId, id);
  }

  @override
  Future<int> update(String userId, String id, String kind, String name,
      DateTime date, int calorie, Uint8List? imageData) async {
    final storagePath = '${userId}_${name}_image';
    String imagePath = '';
    if (imageData != null) {
      imagePath = await firebaseStorageSource.addFile(storagePath, imageData);
    }

    return fireStoreDataSource.update(
        userId, id, kind, name, date, calorie, imagePath);
  }
}
