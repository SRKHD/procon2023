import 'package:flutter/material.dart';

import '../control/editable_card.dart';

class WeightListCard extends StatelessWidget {
  const WeightListCard({
    super.key,
    required this.userId,
    required this.id,
    required this.date,
    required this.value,
    required this.onPressed,
    required this.onPressedDelete,
  });
  final String userId;
  final String id;
  final String date;
  final double value;

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
      subtitle: '$value Kg',
      onPressed: onPressed,
      onPressedDelete: onPressedDelete,
    );
  }
}
