import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/training/training_state.dart';
import '../../usecaese_provider_module.dart';
import 'training_list_notifier.dart';

final trainingListNotifierProvider = StateNotifierProvider<TrainingListNotifier,
    AsyncValue<List<TrainingState>>>(
  (ref) => TrainingListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getTrainingsUsecase: ref.read(getTrainingsUsecaseProvider),
    addTrainingUsecase: ref.read(addTrainingUsecaseProvider),
    synchronizeHealthiaTrainingUsecase:
        ref.read(synchronizeHealthiaTrainingsUsecaseProvider),
  ),
);
