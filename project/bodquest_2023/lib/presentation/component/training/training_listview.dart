import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/training/training_state.dart';
import 'training_list_item.dart';

class TrainingListView extends ConsumerWidget {
  const TrainingListView({
    super.key,
    required this.trainings,
  });

  final List<TrainingState> trainings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: trainings.length,
      itemBuilder: (ctx, index) => TrainingLiteItem(
        kind: trainings[index].kind,
        date: trainings[index].date,
        value: trainings[index].value,
      ),
    ); // return Expanded(
  }
}
