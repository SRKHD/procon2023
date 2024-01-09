import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/value/evaluation_rank.dart';
import '../../notifier/evaluation/evaluation_rank_notifier.dart';
import '../../state/evaluation/evaluation_rank_state.dart';

final evaluationRankNotifierProvider = StateNotifierProvider.family<
    EvaluationRankNotifier, EvaluationRankState, EvaluationRank>(
  (ref, value) {
    return EvaluationRankNotifier(EvaluationRankState(value: value));
  },
);
