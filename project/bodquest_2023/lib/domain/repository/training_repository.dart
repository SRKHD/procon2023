import '../entity/training.dart';

abstract interface class ITrainingRepository {
  Stream<List<Training>> get(String userId);

  Future<int> add(
    String userId,
    String kind,
    DateTime date,
    int value,
  );

  Future<int> delete(
    String userId,
    String id,
  );

  Future<int> update(
    String userId,
    String id,
    String kind,
    DateTime date,
    int value,
  );

  Future<int> synchronizeHealthia(
    String userId,
    DateTime date,
  );
}
