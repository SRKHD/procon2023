import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/training/training_state.dart';
import '../../usecaese_provider_module.dart';
import '../../notifier/training/training_list_notifier.dart';

final trainingListNotifierProvider = StateNotifierProvider<TrainingListNotifier,
    AsyncValue<List<TrainingState>>>(
  (ref) => TrainingListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getUsecase: ref.read(getTrainingsUsecaseProvider),
    addUsecase: ref.read(addTrainingUsecaseProvider),
    deleteUsecase: ref.read(deleteTrainingUsecaseProvider),
    updateUsecase: ref.read(updateTrainingUsecaseProvider),
    synchronizeHealthiaUsecase:
        ref.read(synchronizeHealthiaTrainingsUsecaseProvider),
  ),
);
