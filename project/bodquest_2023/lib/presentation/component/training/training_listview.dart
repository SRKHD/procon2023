import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/training/training_state.dart';
import 'training_list_card.dart';

class TrainingListView extends ConsumerWidget {
  const TrainingListView({
    super.key,
    required this.trainings,
    required this.onPressed,
    required this.onPressedDelete,
  });

  final List<TrainingState> trainings;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: trainings.length,
      itemBuilder: (ctx, index) => TrainingListCard(
        userId: trainings[index].userId,
        id: trainings[index].id,
        kind: trainings[index].kind,
        date: trainings[index].date,
        value: trainings[index].value,
        onPressed: onPressed,
        onPressedDelete: onPressedDelete,
      ),
    ); // return Expanded(
  }
}
