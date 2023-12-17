import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/firestore/rug_get_trainings_response.dart';
import 'firestore_trainings_datasource_impl.dart';

final fireStoreTrainingsDataSourceProvider =
    Provider<IFirestoreTrainingsDataSource>(
  (ref) => FirestoreTrainingsDataSourceImpl(),
);

abstract interface class IFirestoreTrainingsDataSource {
  Stream<RugGetTrainingsResponse> getTrainings(String userId);
  Future<int> addTraining(String userId, String kind, DateTime date, int value);
}
