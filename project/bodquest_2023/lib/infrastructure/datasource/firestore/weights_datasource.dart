import '../../model/firestore/weight/fug_get_weights_response.dart';

abstract interface class IFirestoreWeightsDataSource {
  Stream<FugGetWeightsResponse> get(String userId);
  Future<int> add(String userId, DateTime date, double value);
  Future<int> delete(String userId, String id);
}
