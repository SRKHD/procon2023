import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/value/meal_kind.dart';

part 'meal_kind_state.freezed.dart';

@freezed
class MealKindState with _$MealKindState {
  const factory MealKindState({
    required MealKind value,
  }) = _MealKindState;
}
