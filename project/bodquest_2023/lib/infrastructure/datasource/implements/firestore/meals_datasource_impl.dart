import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/firestore/meal/fug_get_meals_response.dart';
import '../../../model/firestore/meal/fug_meal.dart';
import '../../interface/firestore/meals_datasource.dart';

class FirestoreMealsDataSourceImpl implements IFirestoreMealsDataSource {
  @override
  Stream<FugGetMealsResponse> getMeals(String userId) {
    return FirebaseFirestore.instance
        .collection('meals')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetMealsResponse(results: [
              ...value.docs.map((doc) => FugMeal.fromJson(doc.id, doc.data()))
            ]));
  }

  @override
  Future<int> add(String userId, String kind, String name, DateTime date,
      int calorie, String imageFilePath) async {
    await FirebaseFirestore.instance
        .collection('meals') // コレクションID
        .doc() // ドキュメントID
        .set({
      'userId': userId,
      'kind': kind,
      'name': name,
      'date': Timestamp.fromDate(date),
      'calorie': calorie,
      'imageFilePath': imageFilePath,
    }); // データ
    return 0;
  }

  @override
  Future<int> delete(String userId, String id) {
    FirebaseFirestore.instance
        .collection('meals') // コレクションID
        .doc(id)
        .delete(); // ドキュメントID
    return Future.value(0);
  }

  @override
  Future<int> update(String userId, String id, String kind, String name,
      DateTime date, int calorie, String imageFilePath) {
    try {
      FirebaseFirestore.instance
          .collection('meals') // コレクションID
          .doc(id) // ドキュメントID
          .update({
        'userId': userId,
        'kind': kind,
        'name': name,
        'date': Timestamp.fromDate(date),
        'calorie': calorie,
        'imageFilePath': imageFilePath,
      }); // データ
    } catch (e) {
      print(e);
    }
    return Future.value(0);
  }
}
