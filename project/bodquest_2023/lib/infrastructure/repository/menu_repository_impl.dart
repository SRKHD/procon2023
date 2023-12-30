import '../../domain/entity/menu.dart';
import '../../domain/factory/menu/menu_factory.dart';
import '../../domain/repository/menu_repository.dart';
import '../datasource/firebase_storage/storage_datasource.dart';
import '../datasource/firestore/menus_datasource.dart';

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
  Stream<List<Menu>> findAll(String userId) {
    try {
      return fireStoreDataSource.getMenus(userId).map((event) =>
          [...event.results.map((res) => weightFactory.createFromModel(res))]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addMenu(String userId, String name, DateTime date, String recipe,
      String ingredient, int calorie, String imageFilePath) {
    final storagePath = '${userId}_${name}_image';
    if (imageFilePath != '') {
      firebaseStorageSource.addFile(storagePath, imageFilePath);
    }

    return fireStoreDataSource.addMenu(
        userId, name, date, recipe, ingredient, calorie, storagePath);
  }
}
