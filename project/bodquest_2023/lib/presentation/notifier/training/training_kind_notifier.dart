import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../component/component_types.dart';

part 'training_kind_notifier.g.dart';

/// トレーニング種類を状態管理
@riverpod
class TrainingKindNotifier extends _$TrainingKindNotifier {
  @override
  TrainingKind build(TrainingKind initValue) {
    return initValue;
  }

  void updateTrainingKind(String value) {
    state = TrainingKind.from(value);
  }
}
