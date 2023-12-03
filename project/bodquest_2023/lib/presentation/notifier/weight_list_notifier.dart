import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/get_weights_usecase_impl.dart';
import '../state/weight_state.dart';

final weightListNotifierProvider =
    StateNotifierProvider<WeightListNotifier, AsyncValue<List<WeightState>>>(
  (ref) => WeightListNotifier(
    getWeightsUsecase: ref.read(getWeightsUsecaseProvider),
  ),
);

class WeightListNotifier extends StateNotifier<AsyncValue<List<WeightState>>> {
  WeightListNotifier({required IGetWeightsUsecase getWeightsUsecase})
      : _getWeightsUsecase = getWeightsUsecase,
        super(const AsyncLoading()) {
    _fetch();
  }

  final IGetWeightsUsecase _getWeightsUsecase;

  /// ユーザー一覧の同期
  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final res = await _getWeightsUsecase.execute();
      return res.map((e) => WeightState.fromEntity(e)).toList();
    });
  }
}
