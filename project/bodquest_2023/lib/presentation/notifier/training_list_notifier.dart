import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/add_training_usecase.dart';
import '../../domain/usecase/get_login_user_usecase.dart';
import '../../domain/usecase/get_trainings_usecase.dart';
import '../state/training_state.dart';

final trainingListNotifierProvider = StateNotifierProvider<TrainingListNotifier,
    AsyncValue<List<TrainingState>>>(
  (ref) => TrainingListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getTrainingsUsecase: ref.read(getTrainingsUsecaseProvider),
    addTrainingUsecase: ref.read(addTrainingUsecaseProvider),
  ),
);

class TrainingListNotifier
    extends StateNotifier<AsyncValue<List<TrainingState>>> {
  TrainingListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetTrainingsUsecase getTrainingsUsecase,
    required IAddTrainingUsecase addTrainingUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getTrainingsUsecase = getTrainingsUsecase,
        _addTrainingsUsecase = addTrainingUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetTrainingsUsecase _getTrainingsUsecase;
  final IAddTrainingUsecase _addTrainingsUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getTrainingsUsecase.execute(userId).listen((values) {
      state = AsyncValue.data(
          values.map((weight) => TrainingState.fromEntity(weight)).toList());
    });
  }

  void addTraining(
    String userId,
    String kind,
    DateTime date,
    int value,
  ) {
    _addTrainingsUsecase.execute(userId, kind, date, value);
  }
}
