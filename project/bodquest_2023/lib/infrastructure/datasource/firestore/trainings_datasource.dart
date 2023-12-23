import '../../model/firestore/training/rug_get_trainings_response.dart';

abstract interface class IFirestoreTrainingsDataSource {
  Stream<RugGetTrainingsResponse> getTrainings(String userId);
  Future<int> addTraining(String userId, String kind, DateTime date, int value);
}
