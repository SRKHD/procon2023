import '../../domain/repository/training_repository.dart';
import '../../domain/usecase/add_training_usecase.dart';

class AddTrainingUsecaseImpl implements IAddTrainingUsecase {
  final ITrainingRepository weightRepository;

  AddTrainingUsecaseImpl({
    required ITrainingRepository repository,
  }) : weightRepository = repository;

  @override
  Future<int> execute(
    String userId,
    String kind,
    DateTime date,
    int value,
  ) {
    return weightRepository.addTraining(userId, kind, date, value);
  }
}
