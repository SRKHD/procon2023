import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifier/meal/meal_register_kind_notifier.dart';
import '../component_types.dart';

/// 登録の種類を選ぶドロップダウン
class MealRegisterKindDropDown extends ConsumerWidget {
  const MealRegisterKindDropDown(this.initValue, {super.key});

  final MealRegisterKind initValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 今の季節
    final state = ref.watch(mealRegisterKindNotifierProvider(initValue));

    /// 選択肢たち
    const items = [
      DropdownMenuItem(
        value: MealRegisterKind.meal,
        child: Text('食事登録'),
      ),
      DropdownMenuItem(
        value: MealRegisterKind.recipe,
        child: Text('献立登録'),
      ),
    ];

    /// ドロップダウン本体
    return DropdownButton(
      value: state,
      items: items, // すべての選択肢たち
      onChanged: (newValue) {
        final notifier =
            ref.read(mealRegisterKindNotifierProvider(state).notifier);
        notifier.update(newValue!.value);
      },
      focusColor: Colors.transparent, // 余計な影をなくす
    );
  }
}
