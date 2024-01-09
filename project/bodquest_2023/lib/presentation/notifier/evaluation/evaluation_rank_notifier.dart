import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/evaluation/evaluation_rank_state.dart';

class EvaluationRankNotifier extends StateNotifier<EvaluationRankState> {
  EvaluationRankNotifier(
    super.initValue,
  );

  /// 現在の状態
  EvaluationRankState get value => state;

  void update(EvaluationRankState value) {
    state = value;
  }
}
