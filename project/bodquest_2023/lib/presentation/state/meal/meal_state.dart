import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/meal.dart';

part 'meal_state.freezed.dart';

@freezed
class MealState with _$MealState {
  factory MealState({
    required String userId,
    required String name,
    required String date,
    required int timestamp,
    required int calorie,
    required String imageURL,
  }) = _MealState;

  factory MealState.fromEntity(Meal target) {
    return MealState(
      userId: target.userId,
      name: target.name,
      date: '${target.date.year}年${target.date.month}月${target.date.day}日',
      timestamp: target.timestamp,
      calorie: target.calorie,
      imageURL: target.imageFilePath,
    );
  }
}
