import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../state/weight/weight_state.dart';
import '../control/chart/scrollable_line_chart.dart';

class WeightChart extends ConsumerWidget {
  const WeightChart({
    super.key,
    required this.weights,
  });

  final List<WeightState> weights;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ScrollableLineChart(
        dataSeries: weights,
        fx: (weight) => weight.timestamp.toDouble(),
        fy: (weight) => weight.value,
        dataFormatter: (weight) {
          return "${weight.date}\n${weight.value}kg";
        },
        xFormatter: (x) {
          final formatter = DateFormat("M/d");
          final dtInMs = x.toInt();
          final dt = DateTime.fromMillisecondsSinceEpoch(dtInMs);

          return formatter.format(dt);
        },
        verticalGridInterval: Duration(days: 1).inMilliseconds.toDouble(),
      ),
    );
  }
}
