import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/weight.dart';

part 'weight_state.freezed.dart';

@freezed
class WeightState with _$WeightState {
  factory WeightState({
    required String userId,
    required double value,
  }) = _WeightState;

  factory WeightState.fromEntity(Weight user) {
    return WeightState(
      userId: user.userId,
      value: user.value,
    );
  }
}
