import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/add_training_usecase.dart';

class AddTrainingUsecaseImpl implements IAddTrainingUsecase {
  AddTrainingUsecaseImpl({
    required ITrainingRepository repository,
  }) : trainingRepository = repository;
  final ITrainingRepository trainingRepository;

  @override
  Future<int> execute(
    String userId,
    String kind,
    DateTime date,
    int value,
  ) {
    return trainingRepository.add(userId, kind, date, value);
  }
}
