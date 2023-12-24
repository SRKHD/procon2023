import 'package:freezed_annotation/freezed_annotation.dart';

part 'evaluation_state.freezed.dart';

@freezed
class EvaluationState with _$EvaluationState {
  factory EvaluationState({
    required String rank,
    required int score,
  }) = _EvaluationState;
}
