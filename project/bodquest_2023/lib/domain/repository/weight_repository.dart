import '../entity/weight.dart';

abstract interface class IWeightRepository {
  Stream<List<Weight>> get(String userId);

  Future<int> add(
    String userId,
    DateTime date,
    double value,
  );

  Future<int> delete(
    String userId,
    String id,
  );

  Future<int> update(
    String userId,
    String id,
    DateTime date,
    double value,
  );

  Future<int> synchronizeHealthia(
    String userId,
    DateTime date,
  );
}
