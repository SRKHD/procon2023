import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/weight.dart';

part 'weight_state.freezed.dart';

@freezed
class WeightState with _$WeightState {
  factory WeightState({
    required String userId,
    required double value,
    required DateTime? timestamp,
  }) = _WeightState;

  factory WeightState.fromEntity(Weight target) {
    return WeightState(
      userId: target.userId,
      value: target.value,
      timestamp: target.timestamp,
    );
  }
}
