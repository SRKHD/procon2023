import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/firestore/rug_get_weights_response.dart';
import 'firestore_weights_datasource_impl.dart';

final fireStoreWeightsDataSourceProvider =
    Provider<IFirestoreWeightsDataSource>(
  (ref) => FirestoreWeightsDataSourceImpl(),
);

abstract interface class IFirestoreWeightsDataSource {
  Stream<RugGetWeightsResponse> getWeights({int results});
}
