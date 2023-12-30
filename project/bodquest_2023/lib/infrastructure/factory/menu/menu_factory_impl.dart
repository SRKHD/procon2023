import '../../../domain/entity/menu.dart';
import '../../../domain/factory/menu/menu_factory.dart';
import '../../datasource/firebase_storage/storage_datasource.dart';
import '../../model/firestore/menu/fug_menu.dart';

class MenuFactoryImpl implements IMenuFactory {
  MenuFactoryImpl({required this.firebaseStorageSource});

  final IFirebaseStorageDataSource firebaseStorageSource;

  @override
  Menu create({
    required String userId,
    required String name,
    required DateTime date,
    required int timestamp,
    required String recipe,
    required String ingredient,
    required int calorie,
    required String imageFilePath,
  }) {
    return Menu(
      userId: userId,
      name: name,
      timestamp: timestamp,
      date: date,
      recipe: recipe,
      ingredient: ingredient,
      calorie: calorie,
      imageFilePath: imageFilePath,
    );
  }

  @override
  Menu createFromModel(FugMenu meal) {
    // TODO: MenuFactoryImpl createFromModel 非同期で上手く動作するか怪しい
    firebaseStorageSource.getURL(meal.imageFilePath).then((value) => Menu(
          userId: meal.userId,
          name: meal.name,
          date: meal.date,
          timestamp: meal.timestamp,
          recipe: meal.recipe,
          ingredient: meal.ingredient,
          calorie: meal.calorie,
          imageFilePath: value,
        ));

    return Menu(
      userId: meal.userId,
      name: meal.name,
      date: meal.date,
      timestamp: meal.timestamp,
      recipe: meal.recipe,
      ingredient: meal.ingredient,
      calorie: meal.calorie,
      imageFilePath: '',
    );
  }
}
