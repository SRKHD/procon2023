import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/training_kind_notifier.dart';
import 'component_types.dart';

/// トレーニング種類を選ぶドロップダウン
class TrainingKindDropdown extends ConsumerWidget {
  const TrainingKindDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 今の季節
    final trainingKind = ref.watch(trainingKindNotifierProvider);

    /// 選択肢たち
    const items = [
      DropdownMenuItem(
        value: TrainingKind.walk,
        child: Text('ウォーキング'),
      ),
      DropdownMenuItem(
        value: TrainingKind.run,
        child: Text('ランニング'),
      ),
      DropdownMenuItem(
        value: TrainingKind.workOut,
        child: Text('筋トレ'),
      ),
    ];

    /// ドロップダウン本体
    return DropdownButton(
      value: trainingKind, // 現在の季節
      items: items, // すべての選択肢たち
      onChanged: (newValue) {
        // 状態管理 --> 季節を変更
        final notifier = ref.read(trainingKindNotifierProvider.notifier);
        notifier.updateTrainingKind(newValue!);
      },
      focusColor: Colors.transparent, // 余計な影をなくす
    );
  }
}
