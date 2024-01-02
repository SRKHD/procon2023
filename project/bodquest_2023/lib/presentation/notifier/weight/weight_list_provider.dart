import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/weight/weight_state.dart';
import '../../usecaese_provider_module.dart';
import 'weight_list_notifier.dart';

final weightListNotifierProvider =
    StateNotifierProvider<WeightListNotifier, AsyncValue<List<WeightState>>>(
  (ref) => WeightListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getUsecase: ref.read(getWeightsUsecaseProvider),
    addUsecase: ref.read(addWeightUsecaseProvider),
    deleteUsecase: ref.read(deleteWeightUsecaseProvider),
    updateUsecase: ref.read(updateWeightUsecaseProvider),
    synchronizeHealthiaUsecase:
        ref.read(synchronizeHealthiaWeightsUsecaseProvider),
  ),
);
