import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/value/evaluation_rank.dart';
import '../../state/evaluation/evaluation_state.dart';
import 'evaluation_notifier.dart';

final evaluationNotifierProvider =
    StateNotifierProvider<EvaluationNotifier, EvaluationState>(
  (ref) => EvaluationNotifier(
      EvaluationState(rank: EvaluationRank.g.value, score: 0)),
);
