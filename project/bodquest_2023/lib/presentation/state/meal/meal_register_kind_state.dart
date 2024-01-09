import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/value/meal_register_kind.dart';

part 'meal_register_kind_state.freezed.dart';

@freezed
class MealRegisterKindState with _$MealRegisterKindState {
  const factory MealRegisterKindState({
    required MealRegisterKind value,
  }) = _MealRegisterKindState;
}
