import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/meal/rug_get_meals_response.dart';
import '../../model/firestore/meal/rug_meal.dart';
import 'meals_datasource.dart';

class FirestoreMealsDataSourceImpl implements IFirestoreMealsDataSource {
  @override
  Stream<RugGetMealsResponse> getMeals(String userId) {
    return FirebaseFirestore.instance
        .collection('meals')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => RugGetMealsResponse(results: [
              ...value.docs.map((doc) => RugMeal.fromJson(doc.data()))
            ]));
  }

  @override
  Future<int> addMeal(
      String userId, String name, DateTime date, int calorie) async {
    await FirebaseFirestore.instance
        .collection('meals') // コレクションID
        .doc() // ドキュメントID
        .set({
      'userId': userId,
      'name': name,
      'date': Timestamp.fromDate(date),
      'calorie': calorie,
    }); // データ
    return 0;
  }
}
