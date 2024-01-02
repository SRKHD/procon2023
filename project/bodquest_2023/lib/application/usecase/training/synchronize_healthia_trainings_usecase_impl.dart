import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/synchronize_healthia_trainings_usecase.dart';

class SynchronizeHealthiaTrainingsUsecaseImpl
    implements ISynchronizeHealthiaTrainingsUsecase {
  SynchronizeHealthiaTrainingsUsecaseImpl({
    required ITrainingRepository repository,
  }) : weightRepository = repository;

  final ITrainingRepository weightRepository;

  @override
  Future<int> execute(String userId, DateTime date) {
    return weightRepository.synchronizeHealthia(userId, date);
  }
}
