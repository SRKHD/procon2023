import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/delete_training_usecase.dart';

class DeleteTrainingUsecaseImpl implements IDeleteTrainingUsecase {
  DeleteTrainingUsecaseImpl({
    required ITrainingRepository repository,
  }) : _repository = repository;

  final ITrainingRepository _repository;

  @override
  Future<int> execute(String userId, String id) {
    return _repository.delete(userId, id);
  }
}
