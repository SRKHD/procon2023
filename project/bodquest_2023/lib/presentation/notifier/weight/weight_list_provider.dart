import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/weight/weight_state.dart';
import '../../usecaese_provider_module.dart';
import 'weight_list_notifier.dart';

final weightListNotifierProvider =
    StateNotifierProvider<WeightListNotifier, AsyncValue<List<WeightState>>>(
  (ref) => WeightListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getWeightsUsecase: ref.read(getWeightsUsecaseProvider),
    addWeightUsecase: ref.read(addWeightUsecaseProvider),
  ),
);
