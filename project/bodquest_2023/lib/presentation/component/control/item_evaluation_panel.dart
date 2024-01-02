import 'package:flutter/material.dart';

import 'percent_bar_graph.dart';

class ItemEvaluationPanel extends StatelessWidget {
  const ItemEvaluationPanel({
    super.key,
    required this.title,
    required this.percentBarGraphWidth,
    required this.percentBarGraphHeight,
    required this.percentBarGraphValue,
    required this.onPressed,
  });

  final String title;
  final double percentBarGraphWidth;
  final double percentBarGraphHeight;
  final int percentBarGraphValue;

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
        PercentBarGraph(
          width: percentBarGraphWidth,
          height: percentBarGraphHeight,
          percentValue: percentBarGraphValue,
          onPressed: onPressed,
        )
      ],
    );
  }
}
