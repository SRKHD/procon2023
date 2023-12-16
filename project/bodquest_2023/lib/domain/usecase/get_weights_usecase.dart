import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/usecase/get_weights_usecase_impl.dart';
import '../entity/weight.dart';
import '../repository/weight_repository.dart';

final getWeightsUsecaseProvider = Provider<IGetWeightsUsecase>(
  (ref) => GetWeightsUsecaseImpl(
    repository: ref.watch(weightRepositoryProvider),
  ),
);

/// ユーザー一覧を取得する
abstract interface class IGetWeightsUsecase {
  Stream<List<Weight>> execute(String userId);
}
