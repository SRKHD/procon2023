import '../../domain/entity/menu.dart';
import '../../domain/factory/menu/menu_factory.dart';
import '../../domain/repository/menu_repository.dart';
import '../datasource/interface/firebase_storage/storage_datasource.dart';
import '../datasource/interface/firestore/menus_datasource.dart';

class MenuRepositoryImpl implements IMenuRepository {
  MenuRepositoryImpl({
    required IFirestoreMenusDataSource dataSource,
    required IFirebaseStorageDataSource dataStorage,
    required IMenuFactory factory,
  })  : fireStoreDataSource = dataSource,
        firebaseStorageSource = dataStorage,
        weightFactory = factory;
  final IFirestoreMenusDataSource fireStoreDataSource;
  final IFirebaseStorageDataSource firebaseStorageSource;
  final IMenuFactory weightFactory;

  @override
  Stream<List<Menu>> get(String userId) {
    try {
      return fireStoreDataSource.getMenus(userId).asyncMap((response) =>
          Future.wait(response.results
              .map((result) => weightFactory.createFromModel(result))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> add(String userId, String name, DateTime date, String recipe,
      String ingredient, int calorie, String imageFilePath) {
    final storagePath = '${userId}_${name}_image';
    if (imageFilePath != '') {
      firebaseStorageSource.addFile(storagePath, imageFilePath);
    }

    return fireStoreDataSource.add(
        userId, name, date, recipe, ingredient, calorie, imageFilePath);
  }

  @override
  Future<int> delete(String userId, String id) {
    return fireStoreDataSource.delete(userId, id);
  }

  @override
  Future<int> update(String userId, String id, String name, DateTime date,
      String recipe, String ingredient, int calorie, String imageFilePath) {
    final storagePath = '${userId}_${name}_image';
    if (imageFilePath != '') {
      firebaseStorageSource.addFile(storagePath, imageFilePath);
    }
    return fireStoreDataSource.update(
        userId, id, name, date, recipe, ingredient, calorie, imageFilePath);
  }
}
