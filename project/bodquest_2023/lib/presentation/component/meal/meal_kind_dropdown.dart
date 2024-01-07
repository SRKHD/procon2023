import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifier/meal/meal_kind_notifier.dart';
import '../component_types.dart';

/// 食事の種類を選ぶドロップダウン
class MealKindDropdown extends ConsumerWidget {
  const MealKindDropdown(this.initValue, {super.key});

  final MealKind initValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 今の季節
    final state = ref.watch(mealKindNotifierProvider(initValue));

    /// 選択肢たち
    const items = [
      DropdownMenuItem(
        value: MealKind.breakfast,
        child: Text('朝食'),
      ),
      DropdownMenuItem(
        value: MealKind.lunch,
        child: Text('昼食'),
      ),
      DropdownMenuItem(
        value: MealKind.dinner,
        child: Text('夕食'),
      ),
      DropdownMenuItem(
        value: MealKind.snack,
        child: Text('間食'),
      ),
    ];

    /// ドロップダウン本体
    return DropdownButton(
      value: state,
      items: items, // すべての選択肢たち
      onChanged: (newValue) {
        final notifier = ref.read(mealKindNotifierProvider(state).notifier);
        notifier.update(newValue!.value);
      },
      focusColor: Colors.transparent, // 余計な影をなくす
    );
  }
}
