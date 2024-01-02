import 'package:flutter/material.dart';

import '../../state/weight/weight_state.dart';
import 'weight_list_card.dart';

class WeightListView extends StatelessWidget {
  const WeightListView({
    super.key,
    required this.weights,
  });

  final List<WeightState> weights;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weights.length,
      itemBuilder: (ctx, index) => WeightListCard(
        userId: weights[index].userId,
        date: weights[index].date,
        value: weights[index].value,
      ),
    );
  }
}
