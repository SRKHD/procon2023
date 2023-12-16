import 'package:bodquest_2023/domain/usecase/add_weight_usecase.dart';
import 'package:bodquest_2023/domain/usecase/get_login_user_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/get_weights_usecase.dart';
import '../state/weight_state.dart';

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

  /// ユーザー一覧の同期
  Future<void> _fetch(String userId) async {
    _getWeightsUsecase.execute(userId).listen((weights) {
      state = AsyncValue.data(
          weights.map((weight) => WeightState.fromEntity(weight)).toList());
    });
  }

  void addWeight(
    String userId,
    double value,
  ) {
    _addWeightsUsecase.execute(userId, value);
  }
}
