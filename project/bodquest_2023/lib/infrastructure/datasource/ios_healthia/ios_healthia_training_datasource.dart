import '../../model/firestore/training/fug_get_trainings_response.dart';

abstract interface class IiOSHealthiaTrainingDatasource {
  Stream<FugGetTrainingsResponse> getTrainings(String userId);
}
