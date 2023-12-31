import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/training/add_training_usecase.dart';
import '../../../domain/usecase/training/synchronize_healthia_trainings_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../../domain/usecase/training/get_trainings_usecase.dart';
import '../../state/training/training_state.dart';

class TrainingListNotifier
    extends StateNotifier<AsyncValue<List<TrainingState>>> {
  TrainingListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetTrainingsUsecase getTrainingsUsecase,
    required IAddTrainingUsecase addTrainingUsecase,
    required ISynchronizeHealthiaTrainingsUsecase
        synchronizeHealthiaTrainingUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getTrainingsUsecase = getTrainingsUsecase,
        _addTrainingsUsecase = addTrainingUsecase,
        _synchronizeHealthiaTrainingUsecase =
            synchronizeHealthiaTrainingUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetTrainingsUsecase _getTrainingsUsecase;
  final IAddTrainingUsecase _addTrainingsUsecase;
  final ISynchronizeHealthiaTrainingsUsecase
      _synchronizeHealthiaTrainingUsecase;

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

  void synchronizeHealthia(
    String userId,
    DateTime date,
  ) {
    _synchronizeHealthiaTrainingUsecase.execute(userId, date);
  }
}
