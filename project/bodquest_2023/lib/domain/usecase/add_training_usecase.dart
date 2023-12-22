import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/usecase/add_training_usecase_impl.dart';
import '../repository/training_repository.dart';

final addTrainingUsecaseProvider = Provider<IAddTrainingUsecase>(
  (ref) => AddTrainingUsecaseImpl(
    repository: ref.watch(trainingRepositoryProvider),
  ),
);

/// ユーザー一覧を取得する
abstract interface class IAddTrainingUsecase {
  Future<int> execute(
    String userId,
    String kind,
    DateTime date,
    int value,
  );
}
