import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/weight/add_weight_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../../domain/usecase/weight/get_weights_usecase.dart';
import '../../../domain/usecase/weight/synchronize_healthia_weights_usecase.dart';
import '../../state/weight/weight_state.dart';

class WeightListNotifier extends StateNotifier<AsyncValue<List<WeightState>>> {
  WeightListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetWeightsUsecase getWeightsUsecase,
    required IAddWeightUsecase addWeightUsecase,
    required ISynchronizeHealthiaWeightsUsecase
        synchronizeHealthiaWeightUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getWeightsUsecase = getWeightsUsecase,
        _addWeightsUsecase = addWeightUsecase,
        _synchronizeHealthiaWeightUsecase = synchronizeHealthiaWeightUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetWeightsUsecase _getWeightsUsecase;
  final IAddWeightUsecase _addWeightsUsecase;
  final ISynchronizeHealthiaWeightsUsecase _synchronizeHealthiaWeightUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getWeightsUsecase.execute(userId).listen((weights) {
      state = AsyncValue.data(
          weights.map((weight) => WeightState.fromEntity(weight)).toList());
    }).onError((e) => print(e));
  }

  void addWeight(
    String userId,
    DateTime date,
    double value,
  ) {
    _addWeightsUsecase.execute(userId, date, value);
  }

  void synchronizeHealthia(
    String userId,
    DateTime date,
  ) {
    _synchronizeHealthiaWeightUsecase.execute(userId, date);
  }
}
