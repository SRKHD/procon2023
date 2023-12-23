import '../../model/firestore/weight/rug_get_weights_response.dart';

abstract interface class IFirestoreWeightsDataSource {
  Stream<RugGetWeightsResponse> getWeights(String userId);
  Future<int> addWeight(String userId, DateTime date, double value);
}
