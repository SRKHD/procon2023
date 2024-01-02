import 'package:flutter/material.dart';

import '../../state/weight/weight_state.dart';
import 'weight_list_card.dart';

class WeightListView extends StatelessWidget {
  const WeightListView({
    super.key,
    required this.weights,
    required this.onPressed,
    required this.onPressedDelete,
  });

  final List<WeightState> weights;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weights.length,
      itemBuilder: (ctx, index) => WeightListCard(
        userId: weights[index].userId,
        id: weights[index].id,
        date: weights[index].date,
        value: weights[index].value,
        onPressed: onPressed,
        onPressedDelete: onPressedDelete,
      ),
    );
  }
}
