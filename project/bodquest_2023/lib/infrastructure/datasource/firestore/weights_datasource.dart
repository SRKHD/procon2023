import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/firestore/weight/rug_get_weights_response.dart';
import 'weights_datasource_impl.dart';

final fireStoreWeightsDataSourceProvider =
    Provider<IFirestoreWeightsDataSource>(
  (ref) => FirestoreWeightsDataSourceImpl(),
);

abstract interface class IFirestoreWeightsDataSource {
  Stream<RugGetWeightsResponse> getWeights(String userId);
  Future<int> addWeight(String userId, DateTime date, double value);
}
