import '../../model/firestore/menu/fug_get_menus_response.dart';

abstract interface class IFirestoreMenusDataSource {
  Stream<FugGetMenusResponse> getMenus(String userId);
  Future<int> addMenu(String userId, String name, DateTime date, String recipe,
      String ingredient, int calorie, String imageFilePath);
}
