import 'package:flutter/material.dart';

import '../component_types.dart';
import '../control/editable_card.dart';

class TrainingListCard extends StatelessWidget {
  const TrainingListCard({
    super.key,
    required this.userId,
    required this.id,
    required this.kind,
    required this.value,
    required this.date,
    required this.onPressed,
    required this.onPressedDelete,
  });

  final String userId;
  final String id;
  final String kind;
  final String date;
  final int value;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return EditableCard(
      userId: userId,
      id: id,
      title: date,
      subtitle: switch (TrainingKind.from(kind)) {
        TrainingKind.walk => 'ウォーキング　　$value 歩',
        TrainingKind.run => 'ランニング　　$value m',
        TrainingKind.workOut => '筋トレ　　$value 分',
      },
      onPressed: onPressed,
      onPressedDelete: onPressedDelete,
    );
  }
}
