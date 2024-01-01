import 'package:bodquest_2023/presentation/component/weight/weight_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifier/weight/weight_list_provider.dart';
import '../component/weight/weight_listview.dart';
import '../theme/colors.dart';
import '../theme/l10n.dart';

class WeightListPage extends ConsumerWidget {
  const WeightListPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final state = ref.watch(weightListNotifierProvider);
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
                child: WeightListView(
                  weights: weights,
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
