import 'package:flutter/material.dart';

import 'percent_bar_graph.dart';

class ItemEvaluationPanel extends StatelessWidget {
  const ItemEvaluationPanel(
      {super.key,
      required this.title,
      required this.perceentBarGraphWidth,
      required this.perceentBarGraphHeight,
      required this.perceentBarGraphValue});

  final String title;
  final double perceentBarGraphWidth;
  final double perceentBarGraphHeight;
  final int perceentBarGraphValue;

  @override
  Widget build(BuildContext context) {
    final label = SizedBox(
      width: 30,
      child: Text(title),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        label,
        PerceentBarGraph(
          width: perceentBarGraphWidth,
          height: perceentBarGraphHeight,
          percentValue: perceentBarGraphValue,
        )
      ],
    );
  }
}
