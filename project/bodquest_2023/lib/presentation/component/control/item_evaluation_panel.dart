import 'package:flutter/material.dart';

import 'percent_bar_graph.dart';

class ItemEvaluationPanel extends StatelessWidget {
  const ItemEvaluationPanel({
    super.key,
    required this.title,
    required this.perceentBarGraphWidth,
    required this.perceentBarGraphHeight,
    required this.perceentBarGraphValue,
    required this.onPressed,
  });

  final String title;
  final double perceentBarGraphWidth;
  final double perceentBarGraphHeight;
  final int perceentBarGraphValue;

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final label = SizedBox(
      width: 60,
      child: TextButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        label,
        PerceentBarGraph(
          width: perceentBarGraphWidth,
          height: perceentBarGraphHeight,
          percentValue: perceentBarGraphValue,
          onPressed: onPressed,
        )
      ],
    );
  }
}
