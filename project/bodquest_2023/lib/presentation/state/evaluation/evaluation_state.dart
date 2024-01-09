import 'package:freezed_annotation/freezed_annotation.dart';

part 'evaluation_state.freezed.dart';

@freezed
class EvaluationState with _$EvaluationState {
  factory EvaluationState({
    required String rank,
    required int score,
    required int weightScore,
    required int exerciseScore,
    required int mealScore,
    required double predictedWeight,
  }) = _EvaluationState;
}
