import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/util/datetime_utils.dart';
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
      date: toJPNDateString(target.date),
      timestamp: target.timestamp,
      calorie: target.calorie,
      imageURL: target.imageFilePath,
    );
  }
}
