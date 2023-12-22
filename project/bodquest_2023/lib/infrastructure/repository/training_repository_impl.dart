import '../../domain/entity/training.dart';
import '../../domain/factory/training/training_factory.dart';
import '../../domain/repository/training_repository.dart';
import '../datasource/firestore/trainings_datasource.dart';

class TrainingRepositoryImpl implements ITrainingRepository {
  TrainingRepositoryImpl({
    required IFirestoreTrainingsDataSource dataSource,
    required ITrainingFactory factory,
  })  : fireStoreDataSource = dataSource,
        trainingFactory = factory;
  final IFirestoreTrainingsDataSource fireStoreDataSource;
  final ITrainingFactory trainingFactory;

  @override
  Stream<List<Training>> findAll(String userId) {
    try {
      return fireStoreDataSource.getTrainings(userId).map((event) => [
            ...event.results.map((res) => trainingFactory.createFromModel(res))
          ]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addTraining(
    String userId,
    String kind,
    DateTime date,
    int value,
  ) {
    return fireStoreDataSource.addTraining(userId, kind, date, value);
  }
}
