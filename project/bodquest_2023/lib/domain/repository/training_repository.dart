import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/datasource/firestore_trainings_datasource.dart';
import '../../infrastructure/repository/training_repository_impl.dart';
import '../entity/training.dart';
import '../factory/training_factory.dart';

final trainingRepositoryProvider = Provider<ITrainingRepository>(
  (ref) => TrainingRepositoryImpl(
    dataSource: ref.watch(fireStoreTrainingsDataSourceProvider),
    factory: ref.watch(trainingFactoryProvider),
  ),
);

abstract interface class ITrainingRepository {
  /// ユーザー一覧の取得
  Stream<List<Training>> findAll(String userId);
  Future<int> addTraining(
    String userId,
    String kind,
    DateTime date,
    int value,
  );
}
