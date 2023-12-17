import '../../domain/entity/training.dart';
import '../../domain/repository/training_repository.dart';
import '../../domain/usecase/get_trainings_usecase.dart';

class GetTrainingsUsecaseImpl implements IGetTrainingsUsecase {
  final ITrainingRepository weightRepository;

  GetTrainingsUsecaseImpl({
    required ITrainingRepository repository,
  }) : weightRepository = repository;

  @override
  Stream<List<Training>> execute(String userId) {
    return weightRepository.findAll(userId);
  }
}
