import '../../model/firestore/training/fug_get_trainings_response.dart';

abstract interface class IFirestoreTrainingsDataSource {
  Stream<FugGetTrainingsResponse> getTrainings(String userId);
  Future<int> addTraining(String userId, String kind, DateTime date, int value);
}
