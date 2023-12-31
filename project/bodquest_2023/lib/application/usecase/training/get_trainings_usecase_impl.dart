import '../../../domain/entity/training.dart';
import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/get_trainings_usecase.dart';

class GetTrainingsUsecaseImpl implements IGetTrainingsUsecase {
  final ITrainingRepository trainingRepository;

  GetTrainingsUsecaseImpl({
    required ITrainingRepository repository,
  }) : trainingRepository = repository;

  @override
  Stream<List<Training>> execute(String userId) {
    return trainingRepository.findAll(userId);
  }
}
