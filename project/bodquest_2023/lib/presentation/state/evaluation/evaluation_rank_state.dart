import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/value/evaluation_rank.dart';

part 'evaluation_rank_state.freezed.dart';

@freezed
class EvaluationRankState with _$EvaluationRankState {
  const factory EvaluationRankState({
    required EvaluationRank value,
  }) = _EvaluationRankState;
}
