import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/add_training_usecase.dart';

class AddTrainingUsecaseImpl implements IAddTrainingUsecase {
  AddTrainingUsecaseImpl({
    required ITrainingRepository repository,
  }) : _repository = repository;
  final ITrainingRepository _repository;

  @override
  Future<int> execute(
    String userId,
    String kind,
    DateTime date,
    int value,
  ) {
    return _repository.add(userId, kind, date, value);
  }
}
