import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/menu/fug_get_menus_response.dart';
import '../../model/firestore/menu/fug_menu.dart';
import 'menus_datasource.dart';

class FirestoreMenusDataSourceImpl implements IFirestoreMenusDataSource {
  @override
  Stream<FugGetMenusResponse> getMenus(String userId) {
    return FirebaseFirestore.instance
        .collection('menus')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetMenusResponse(results: [
              ...value.docs.map((doc) => FugMenu.fromJson(doc.data()))
            ]));
  }

  @override
  Future<int> addMenu(String userId, String name, DateTime date, String recipe,
      String ingredient, int calorie, String imageFilePath) async {
    await FirebaseFirestore.instance
        .collection('menus') // コレクションID
        .doc() // ドキュメントID
        .set({
      'userId': userId,
      'name': name,
      'date': Timestamp.fromDate(date),
      'recipe': recipe,
      'ingredient': ingredient,
      'calorie': calorie,
      'imageFilePath': imageFilePath,
    }); // データ
    return 0;
  }
}
