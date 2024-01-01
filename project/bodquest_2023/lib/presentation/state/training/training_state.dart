import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/training.dart';

part 'training_state.freezed.dart';

@freezed
class TrainingState with _$TrainingState {
  factory TrainingState({
    required String userId,
    required String kind,
    required String date,
    required int timestamp,
    required int value,
  }) = _TrainingState;

  factory TrainingState.fromEntity(Training target) {
    return TrainingState(
      userId: target.userId,
      kind: target.kind.name,
      date: '${target.date.year}年${target.date.month}月${target.date.day}日',
      timestamp: target.timestamp,
      value: target.value,
    );
  }
}
