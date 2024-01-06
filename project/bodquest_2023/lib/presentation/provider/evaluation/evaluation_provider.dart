import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/value/evaluation_rank.dart';
import '../../state/evaluation/evaluation_state.dart';
import '../../notifier/evaluation/evaluation_notifier.dart';

final evaluationNotifierProvider =
    StateNotifierProvider<EvaluationNotifier, EvaluationState>(
  (ref) => EvaluationNotifier(EvaluationState(
    rank: EvaluationRank.g.stringValue,
    score: 0,
    weightScore: 0,
    exerciseScore: 0,
  )),
);
