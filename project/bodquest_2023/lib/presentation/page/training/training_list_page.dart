import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/training/training_listview.dart';
import '../../notifier/training/training_list_provider.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class TrainingListPage extends ConsumerWidget {
  const TrainingListPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final state = ref.watch(trainingListNotifierProvider);
    return state.when(
      data: (trainings) {
        trainings.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColor.moriGreen,
            title: const Text(L10n.weightlist),
          ),
          body: Column(
            children: [
              Expanded(
                child: TrainingListView(
                  trainings: trainings,
                ),
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
