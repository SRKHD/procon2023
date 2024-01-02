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
    required IGetTrainingsUsecase getUsecase,
    required IAddTrainingUsecase addUsecase,
    required IDeleteTrainingUsecase deleteUsecase,
    required IUpdateTrainingUsecase updateUsecase,
    required ISynchronizeHealthiaTrainingsUsecase synchronizeHealthiaUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getUsecase = getUsecase,
        _addUsecase = addUsecase,
        _deleteUsecase = deleteUsecase,
        _updateUsecase = updateUsecase,
        _synchronizeHealthiaUsecase = synchronizeHealthiaUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetTrainingsUsecase _getUsecase;
  final IAddTrainingUsecase _addUsecase;
  final IDeleteTrainingUsecase _deleteUsecase;
  final IUpdateTrainingUsecase _updateUsecase;
  final ISynchronizeHealthiaTrainingsUsecase _synchronizeHealthiaUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getUsecase.execute(userId).listen((values) {
      state = AsyncValue.data(
          values.map((weight) => TrainingState.fromEntity(weight)).toList());
    });
  }

  void add(
    String userId,
    String kind,
    DateTime date,
    int value,
  ) {
    _addUsecase.execute(userId, kind, date, value);
  }

  void delete(
    String userId,
    String id,
  ) {
    _deleteUsecase.execute(userId, id);
  }

  void update(
    String userId,
    String id,
    String kind,
    DateTime date,
    int value,
  ) {
    _updateUsecase.execute(userId, id, kind, date, value);
  }

  void synchronizeHealthia(
    String userId,
    DateTime date,
  ) {
    _synchronizeHealthiaUsecase.execute(userId, date);
  }
}
