import '../../model/firestore/weight/fug_get_weights_response.dart';

abstract interface class IFirestoreWeightsDataSource {
  Stream<FugGetWeightsResponse> getWeights(String userId);
  Future<int> addWeight(String userId, DateTime date, double value);
}
