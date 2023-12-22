import '../../entity/training.dart';
import '../../repository/training_repository.dart';
import '../../usecase/get_trainings_usecase.dart';

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
