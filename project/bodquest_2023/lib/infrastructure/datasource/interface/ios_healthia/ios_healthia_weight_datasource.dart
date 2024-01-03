import '../../../model/firestore/weight/fug_get_weights_response.dart';

abstract interface class IiOSHealthiaWeightDatasource {
  Stream<FugGetWeightsResponse> getWeights(String userId);
}
