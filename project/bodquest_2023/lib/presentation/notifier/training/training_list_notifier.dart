import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/training/add_training_usecase.dart';
import '../../../domain/usecase/training/delete_training_usecase.dart';
import '../../../domain/usecase/training/synchronize_healthia_trainings_usecase.dart';
import '../../../domain/usecase/training/update_training_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../../domain/usecase/training/get_trainings_usecase.dart';
import '../../state/training/training_state.dart';

class TrainingListNotifier
    extends StateNotifier<AsyncValue<List<TrainingState>>> {
  TrainingListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetTrainingsUsecase getTrainingsUsecase,
    required IAddTrainingUsecase addTrainingUsecase,
    required IDeleteTrainingUsecase deleteTrainingUsecase,
    required IUpdateTrainingUsecase updateTrainingUsecase,
    required ISynchronizeHealthiaTrainingsUsecase
        synchronizeHealthiaTrainingUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getTrainingsUsecase = getTrainingsUsecase,
        _addTrainingsUsecase = addTrainingUsecase,
        _deleteTrainingUsecase = deleteTrainingUsecase,
        _updateTrainingUsecase = updateTrainingUsecase,
        _synchronizeHealthiaTrainingUsecase =
            synchronizeHealthiaTrainingUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetTrainingsUsecase _getTrainingsUsecase;
  final IAddTrainingUsecase _addTrainingsUsecase;
  final IDeleteTrainingUsecase _deleteTrainingUsecase;
  final IUpdateTrainingUsecase _updateTrainingUsecase;
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

  void delete(
    String userId,
    String id,
  ) {
    _deleteTrainingUsecase.execute(userId, id);
  }

  void update(
    String userId,
    String id,
    String kind,
    DateTime date,
    int value,
  ) {
    _updateTrainingUsecase.execute(userId, id, kind, date, value);
  }

  void synchronizeHealthia(
    String userId,
    DateTime date,
  ) {
    _synchronizeHealthiaTrainingUsecase.execute(userId, date);
  }
}
