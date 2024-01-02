import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/update_training_usecase.dart';

class UpdateTrainingUsecaseImpl implements IUpdateTrainingUsecase {
  UpdateTrainingUsecaseImpl({
    required ITrainingRepository repository,
  }) : _repository = repository;

  final ITrainingRepository _repository;

  @override
  Future<int> execute(
      String userId, String id, String kind, DateTime date, int value) {
    return _repository.update(userId, id, kind, date, value);
  }
}
