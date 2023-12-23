import 'rug_meal.dart';

class RugGetMealsResponse {
  final List<RugMeal> results;

  RugGetMealsResponse({
    required this.results,
  });

  factory RugGetMealsResponse.fromJson(Map<String, dynamic>? json) {
    return RugGetMealsResponse(results: [RugMeal.fromJson(json)]
        // results: json?['results']
        //     .map<RugMeal>((e) => RugMeal.fromJson(e))
        //     .toList(),
        );
  }
}
