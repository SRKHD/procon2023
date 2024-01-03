import '../../../model/firestore/training/fug_get_trainings_response.dart';

abstract interface class IFirestoreTrainingsDataSource {
  Stream<FugGetTrainingsResponse> get(String userId);
  Future<int> add(String userId, String kind, DateTime date, int value);
  Future<int> delete(String userId, String id);
  Future<int> update(
      String userId, String id, String kind, DateTime date, int value);
}
