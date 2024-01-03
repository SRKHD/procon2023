import 'fug_meal.dart';

class FugGetMealsResponse {
  final List<FugMeal> results;

  FugGetMealsResponse({
    required this.results,
  });

  factory FugGetMealsResponse.fromJson(
      String docId, Map<String, dynamic>? json) {
    return FugGetMealsResponse(results: [FugMeal.fromJson(docId, json)]);
  }
}
