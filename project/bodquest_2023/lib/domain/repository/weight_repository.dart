import '../entity/weight.dart';

abstract interface class IWeightRepository {
  Stream<List<Weight>> findAll(String userId);

  Future<int> add(
    String userId,
    DateTime date,
    double value,
  );

  Future<int> delete(
    String userId,
    String id,
  );

  Future<int> synchronizeHealthia(
    String userId,
    DateTime date,
  );
}
