import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/training/training_state.dart';
import 'training_list_item.dart';

class TrainingList extends ConsumerWidget {
  const TrainingList({
    super.key,
    required this.trainings,
  });

  final List<TrainingState> trainings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView(
        children: trainings
            .map(
              (e) => TrainingLiteItem(
                kind: e.kind,
                date: e.date,
                value: e.value,
              ),
            )
            .toList(),
      ),
    );
  }
}
