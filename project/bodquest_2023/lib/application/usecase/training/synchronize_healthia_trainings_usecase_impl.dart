import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/synchronize_healthia_trainings_usecase.dart';

class SynchronizeHealthiaTrainingsUsecaseImpl
    implements ISynchronizeHealthiaTrainingsUsecase {
  SynchronizeHealthiaTrainingsUsecaseImpl({
    required ITrainingRepository repository,
  }) : _repository = repository;

  final ITrainingRepository _repository;

  @override
  Future<int> execute(String userId, DateTime date) {
    return _repository.synchronizeHealthia(userId, date);
  }
}
