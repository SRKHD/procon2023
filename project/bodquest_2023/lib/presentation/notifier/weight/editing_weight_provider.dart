import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/weight/weight_state.dart';
import 'editing_weight_notifier.dart';
import 'weight_list_provider.dart';

final editingWeightNotifierProvider =
    StateNotifierProvider.family<EditingWeightNotifier, WeightState, String>(
  (ref, id) {
    //
    final items = ref.read(weightListNotifierProvider).value!;
    final item = items.firstWhere((value) => value.id == id);
    return EditingWeightNotifier(WeightState(
        userId: item.userId,
        id: item.id,
        date: item.date,
        timestamp: item.timestamp,
        value: item.value));
  },
);
