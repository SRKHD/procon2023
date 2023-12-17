import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/usecase/get_trainings_usecase_impl.dart';
import '../entity/training.dart';
import '../repository/training_repository.dart';

final getTrainingsUsecaseProvider = Provider<IGetTrainingsUsecase>(
  (ref) => GetTrainingsUsecaseImpl(
    repository: ref.watch(trainingRepositoryProvider),
  ),
);

/// ユーザー一覧を取得する
abstract interface class IGetTrainingsUsecase {
  Stream<List<Training>> execute(String userId);
}
