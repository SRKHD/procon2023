import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/meal/fug_get_meals_response.dart';
import '../../model/firestore/meal/fug_meal.dart';
import 'meals_datasource.dart';

class FirestoreMealsDataSourceImpl implements IFirestoreMealsDataSource {
  @override
  Stream<FugGetMealsResponse> getMeals(String userId) {
    return FirebaseFirestore.instance
        .collection('meals')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetMealsResponse(results: [
              ...value.docs.map((doc) => FugMeal.fromJson(doc.data()))
            ]));
  }

  @override
  Future<int> addMeal(String userId, String name, DateTime date, int calorie,
      String imageURL) async {
    await FirebaseFirestore.instance
        .collection('meals') // コレクションID
        .doc() // ドキュメントID
        .set({
      'userId': userId,
      'name': name,
      'date': Timestamp.fromDate(date),
      'calorie': calorie,
      'imageURL': imageURL,
    }); // データ
    return 0;
  }
}
