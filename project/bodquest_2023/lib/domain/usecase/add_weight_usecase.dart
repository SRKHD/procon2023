import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/usecase/add_weight_usecase_impl.dart';
import '../repository/weight_repository.dart';

final addWeightUsecaseProvider = Provider<IAddWeightUsecase>(
  (ref) => AddWeightUsecaseImpl(
    repository: ref.watch(weightRepositoryProvider),
  ),
);

/// ユーザー一覧を取得する
abstract interface class IAddWeightUsecase {
  Future<int> execute(
    String userId,
    DateTime date,
    double value,
  );
}
