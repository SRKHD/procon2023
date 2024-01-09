import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/value/training_kind.dart';
import '../../notifier/training/training_kind_notifier.dart';
import '../../state/training/training_kind_state.dart';

final trainingKindNotifierProvider = StateNotifierProvider.family<
    TrainingKindNotifier, TrainingKindState, TrainingKind>(
  (ref, value) {
    return TrainingKindNotifier(TrainingKindState(value: value));
  },
);
