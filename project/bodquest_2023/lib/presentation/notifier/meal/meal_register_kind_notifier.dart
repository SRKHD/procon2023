import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../component/component_types.dart';

part 'meal_register_kind_notifier.g.dart';

/// 食事登録の種類を状態管理
@riverpod
class MealRegisterKindNotifier extends _$MealRegisterKindNotifier {
  @override
  MealRegisterKind build(MealRegisterKind initValue) {
    return initValue;
  }

  void update(String value) {
    state = MealRegisterKind.from(value);
  }
}
