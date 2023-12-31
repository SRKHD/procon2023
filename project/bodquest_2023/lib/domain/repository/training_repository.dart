import '../entity/training.dart';

abstract interface class ITrainingRepository {
  Stream<List<Training>> findAll(String userId);

  Future<int> addTraining(
    String userId,
    String kind,
    DateTime date,
    int value,
  );

  Future<int> synchronizeHealthiaTrainings(
    String userId,
    DateTime date,
  );
}
