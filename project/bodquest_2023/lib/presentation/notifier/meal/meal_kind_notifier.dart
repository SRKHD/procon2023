import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/value/meal_kind.dart';

part 'meal_kind_notifier.g.dart';

/// 食事の種類を状態管理
@riverpod
class MealKindNotifier extends _$MealKindNotifier {
  @override
  MealKind build(MealKind initValue) {
    return initValue;
  }

  void update(String value) {
    state = MealKind.from(value);
  }
}
