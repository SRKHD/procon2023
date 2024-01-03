import '../../../domain/entity/meal.dart';
import '../../../domain/factory/meal/meal_factory.dart';
import '../../datasource/interface/firebase_storage/storage_datasource.dart';
import '../../model/firestore/meal/fug_meal.dart';

class MealFactoryImpl implements IMealFactory {
  MealFactoryImpl({required this.firebaseStorageSource});

  final IFirebaseStorageDataSource firebaseStorageSource;

  @override
  Meal create({
    required String id,
    required String userId,
    required String name,
    required DateTime date,
    required int timestamp,
    required int calorie,
    required String imageFilePath,
  }) {
    return Meal(
      id: id,
      userId: userId,
      name: name,
      calorie: calorie,
      timestamp: timestamp,
      date: date,
      imageFilePath: imageFilePath,
    );
  }

  @override
  Future<Meal> createFromModel(FugMeal meal) {
    return firebaseStorageSource
        .getURL(meal.imageFilePath)
        .then((value) => Meal(
              id: meal.id,
              userId: meal.userId,
              name: meal.name,
              date: meal.date,
              timestamp: meal.timestamp,
              calorie: meal.calorie,
              imageFilePath: value,
            ));
  }
}
