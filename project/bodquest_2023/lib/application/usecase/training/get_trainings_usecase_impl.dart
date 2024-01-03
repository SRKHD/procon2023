import '../../../domain/entity/training.dart';
import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/get_trainings_usecase.dart';

class GetTrainingsUsecaseImpl implements IGetTrainingsUsecase {
  final ITrainingRepository _repository;

  GetTrainingsUsecaseImpl({
    required ITrainingRepository repository,
  }) : _repository = repository;

  @override
  Stream<List<Training>> execute(String userId) {
    return _repository.get(userId);
  }
}
