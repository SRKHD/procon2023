import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifier/weight/weight_list_provider.dart';
import '../component/weight/weight_listview.dart';

class WeightListPage extends HookConsumerWidget {
  const WeightListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weightItems = ref.watch(weightListNotifierProvider);
    return Column(
      children: [
        ListView.builder(
          itemCount: weightItems.length,
          itemBuilder: (context, index) {
            return WeightListView(
              weights: weightItems,
            );
          },
        )
      ],
    );
  }
}
