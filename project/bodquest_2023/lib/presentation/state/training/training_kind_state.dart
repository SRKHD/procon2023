import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/value/training_kind.dart';

part 'training_kind_state.freezed.dart';

@freezed
class TrainingKindState with _$TrainingKindState {
  const factory TrainingKindState({
    required TrainingKind kind,
  }) = _TrainingKindState;
}
