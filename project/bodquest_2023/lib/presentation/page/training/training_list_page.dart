import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/training/training_listview.dart';
import '../../notifier/training/training_list_provider.dart';
import '../../router/go_router.dart';
import '../../router/page_path.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class TrainingListPage extends ConsumerWidget {
  const TrainingListPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final state = ref.watch(trainingListNotifierProvider);
    final notifier = ref.watch(trainingListNotifierProvider.notifier);
    return state.when(
      data: (trainings) {
        trainings.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColor.moriGreen,
            title: const Text(L10n.list),
          ),
          body: Column(
            children: [
              Expanded(
                child: TrainingListView(
                  trainings: trainings,
                  onPressed: (userId, id) {
                    final router = ref.read(goRouterProvider);
                    router.pushNamed(
                      PageId.trainingedit.routeName,
                      pathParameters: {'id': id},
                    );
                  },
                  onPressedDelete: (userId, id) => notifier.delete(userId, id),
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
