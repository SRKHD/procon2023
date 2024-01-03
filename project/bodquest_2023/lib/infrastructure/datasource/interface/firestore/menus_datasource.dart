import '../../../model/firestore/menu/fug_get_menus_response.dart';

abstract interface class IFirestoreMenusDataSource {
  Stream<FugGetMenusResponse> getMenus(String userId);
  Future<int> add(String userId, String name, DateTime date, String recipe,
      String ingredient, int calorie, String imageFilePath);
  Future<int> delete(String userId, String id);
  Future<int> update(String userId, String id, String name, DateTime date,
      String recipe, String ingredient, int calorie, String imageFilePath);
}
