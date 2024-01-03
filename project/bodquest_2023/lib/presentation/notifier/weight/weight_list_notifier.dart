import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/weight/add_weight_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../../domain/usecase/weight/delete_weight_usecase.dart';
import '../../../domain/usecase/weight/get_weights_usecase.dart';
import '../../../domain/usecase/weight/synchronize_healthia_weights_usecase.dart';
import '../../../domain/usecase/weight/update_weight_usecase.dart';
import '../../state/weight/weight_state.dart';

class WeightListNotifier extends StateNotifier<AsyncValue<List<WeightState>>> {
  WeightListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetWeightsUsecase getUsecase,
    required IAddWeightUsecase addUsecase,
    required IDeleteWeightUsecase deleteUsecase,
    required IUpdateWeightUsecase updateUsecase,
    required ISynchronizeHealthiaWeightsUsecase synchronizeHealthiaUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getUsecase = getUsecase,
        _addWeightUsecase = addUsecase,
        _deleteWeightUsecase = deleteUsecase,
        _updateWeightUsecase = updateUsecase,
        _synchronizeHealthiaWeightUsecase = synchronizeHealthiaUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetWeightsUsecase _getUsecase;
  final IAddWeightUsecase _addWeightUsecase;
  final IDeleteWeightUsecase _deleteWeightUsecase;
  final IUpdateWeightUsecase _updateWeightUsecase;
  final ISynchronizeHealthiaWeightsUsecase _synchronizeHealthiaWeightUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getUsecase.execute(userId).listen((weights) {
      state = AsyncValue.data(
          weights.map((weight) => WeightState.fromEntity(weight)).toList());
    }).onError((e) => print(e));
  }

  void add(
    String userId,
    DateTime date,
    double value,
  ) {
    _addWeightUsecase.execute(userId, date, value);
  }

  void delete(
    String userId,
    String id,
  ) {
    _deleteWeightUsecase.execute(userId, id);
  }

  void update(
    String userId,
    String id,
    DateTime date,
    double value,
  ) {
    _updateWeightUsecase.execute(userId, id, date, value);
  }

  void synchronizeHealthia(
    String userId,
    DateTime date,
  ) {
    _synchronizeHealthiaWeightUsecase.execute(userId, date);
  }
}
