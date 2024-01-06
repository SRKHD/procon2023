import 'package:bodquest_2023/presentation/state/training/training_kind_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/value/training_kind.dart';
import '../../provider/training/training_kind_provider.dart';

/// トレーニング種類を選ぶドロップダウン
class TrainingKindDropdown extends ConsumerWidget {
  const TrainingKindDropdown(this.initValue, {super.key});

  final TrainingKind initValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 今の季節
    final state = ref.watch(trainingKindNotifierProvider(initValue));

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
      value: state.kind,
      items: items, // すべての選択肢たち
      onChanged: (newValue) {
        final notifier =
            ref.read(trainingKindNotifierProvider(state.kind).notifier);
        notifier.update(TrainingKindState(kind: newValue!));
      },
      focusColor: Colors.transparent, // 余計な影をなくす
    );
  }
}
