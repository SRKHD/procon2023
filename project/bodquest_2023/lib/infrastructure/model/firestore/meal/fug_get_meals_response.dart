import 'fug_meal.dart';

class FugGetMealsResponse {
  final List<FugMeal> results;

  FugGetMealsResponse({
    required this.results,
  });

  factory FugGetMealsResponse.fromJson(Map<String, dynamic>? json) {
    return FugGetMealsResponse(results: [FugMeal.fromJson(json)]
        // results: json?['results']
        //     .map<FugMeal>((e) => FugMeal.fromJson(e))
        //     .toList(),
        );
  }
}
