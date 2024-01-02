import 'package:freezed_annotation/freezed_annotation.dart';

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
      date: '${target.date.year}年${target.date.month}月${target.date.day}日',
      timestamp: target.timestamp,
      value: target.value,
    );
  }
}
