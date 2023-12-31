import 'dart:async';

import '../../model/firestore/weight/fug_get_weights_response.dart';

abstract interface class IiOSHealthiaWeightDatasource {
  FutureOr<FugGetWeightsResponse> getWeights(String userId);
}
