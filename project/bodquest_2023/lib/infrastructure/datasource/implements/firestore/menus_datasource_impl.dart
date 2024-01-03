import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/firestore/menu/fug_get_menus_response.dart';
import '../../../model/firestore/menu/fug_menu.dart';
import '../../interface/firestore/menus_datasource.dart';

class FirestoreMenusDataSourceImpl implements IFirestoreMenusDataSource {
  @override
  Stream<FugGetMenusResponse> getMenus(String userId) {
    return FirebaseFirestore.instance
        .collection('menus')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetMenusResponse(results: [
              ...value.docs.map((doc) => FugMenu.fromJson(doc.id, doc.data()))
            ]));
  }

  @override
  Future<int> add(String userId, String name, DateTime date, String recipe,
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

  @override
  Future<int> delete(String userId, String id) {
    FirebaseFirestore.instance
        .collection('menus') // コレクションID
        .doc(id)
        .delete(); // ドキュメントID
    return Future.value(0);
  }

  @override
  Future<int> update(String userId, String id, String name, DateTime date,
      String recipe, String ingredient, int calorie, String imageFilePath) {
    try {
      FirebaseFirestore.instance
          .collection('menus') // コレクションID
          .doc(id) // ドキュメントID
          .update({
        'userId': userId,
        'name': name,
        'date': Timestamp.fromDate(date),
        'recipe': recipe,
        'ingredient': ingredient,
        'calorie': calorie,
        'imageFilePath': imageFilePath,
      }); // データ
    } catch (e) {
      print(e);
    }
    return Future.value(0);
  }
}
