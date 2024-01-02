import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/weight/weight_chart.dart';
import '../../notifier/weight/weight_list_provider.dart';
import '../../component/weight/weight_listview.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class WeightListPage extends ConsumerWidget {
  const WeightListPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final state = ref.watch(weightListNotifierProvider);
    final notifier = ref.watch(weightListNotifierProvider.notifier);
    return state.when(
      data: (weights) {
        weights.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColor.moriGreen,
            title: const Text(L10n.weightlist),
          ),
          body: Column(
            children: [
              WeightChart(weights: weights),
              Expanded(
                flex: 2,
                child: WeightListView(
                  weights: weights,
                  onPressed: (userId, id) => {},
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
