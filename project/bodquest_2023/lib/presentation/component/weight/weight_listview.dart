import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/weight/weight_state.dart';
import 'weight_list_item.dart';

class WeightListView extends ConsumerWidget {
  const WeightListView({
    super.key,
    required this.weights,
  });

  final List<WeightState> weights;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView(
        children: weights
            .map(
              (e) => WeightLiteItem(
                userId: e.userId,
                date: e.date,
                value: e.value,
              ),
            )
            .toList(),
      ),
    );
  }
}
