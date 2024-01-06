import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/training/training_kind_state.dart';

/// トレーニング種類を状態管理
class TrainingKindNotifier extends StateNotifier<TrainingKindState> {
  TrainingKindNotifier(
    super.initValue,
  );

  /// 現在の状態
  TrainingKindState get value => state;

  void update(TrainingKindState value) {
    state = value;
  }
}
