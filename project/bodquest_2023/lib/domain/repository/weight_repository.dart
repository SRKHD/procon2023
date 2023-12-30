import '../entity/weight.dart';

abstract interface class IWeightRepository {
  Stream<List<Weight>> findAll(String userId);
  Future<int> addWeight(
    String userId,
    DateTime date,
    double value,
  );
}
