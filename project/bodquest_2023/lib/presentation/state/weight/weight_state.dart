import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/util/datetime_utils.dart';
import '../../../domain/entity/weight.dart';

part 'weight_state.freezed.dart';

@freezed
class WeightState with _$WeightState {
  factory WeightState({
    required String userId,
    required String id,
    required String date,
    required int timestamp,
    required double value,
  }) = _WeightState;

  factory WeightState.fromEntity(Weight target) {
    return WeightState(
      userId: target.userId,
      id: target.id,
      date: toJPNDateString(target.date),
      timestamp: target.timestamp,
      value: target.value,
    );
  }
}
