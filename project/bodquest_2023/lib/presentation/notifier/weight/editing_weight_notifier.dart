import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/weight/weight_state.dart';

class EditingWeightNotifier extends StateNotifier<WeightState> {
  EditingWeightNotifier(super.state);

  WeightState get value => state;

  void update(WeightState value) {
    state = value;
  }
}
