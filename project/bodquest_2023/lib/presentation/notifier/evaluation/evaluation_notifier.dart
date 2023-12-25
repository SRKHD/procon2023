import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/evaluation/evaluation_state.dart';

class EvaluationNotifier extends StateNotifier<EvaluationState> {
  EvaluationNotifier(super.state);

  EvaluationState get value => state;

  void update(EvaluationState value) {
    state = value;
  }
}
