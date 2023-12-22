import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain_module.dart';
import '../../../domain/usecase/weight/add_weight_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../../domain/usecase/weight/get_weights_usecase.dart';
import '../../state/weight/weight_state.dart';

final weightListNotifierProvider =
    StateNotifierProvider<WeightListNotifier, AsyncValue<List<WeightState>>>(
  (ref) => WeightListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getWeightsUsecase: ref.read(getWeightsUsecaseProvider),
    addWeightUsecase: ref.read(addWeightUsecaseProvider),
  ),
);

class WeightListNotifier extends StateNotifier<AsyncValue<List<WeightState>>> {
  WeightListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetWeightsUsecase getWeightsUsecase,
    required IAddWeightUsecase addWeightUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getWeightsUsecase = getWeightsUsecase,
        _addWeightsUsecase = addWeightUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetWeightsUsecase _getWeightsUsecase;
  final IAddWeightUsecase _addWeightsUsecase;

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
}
