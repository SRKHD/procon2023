import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/delete_training_usecase.dart';

class DeleteTrainingUsecaseImpl implements IDeleteTrainingUsecase {
  DeleteTrainingUsecaseImpl({
    required ITrainingRepository repository,
  }) : weightRepository = repository;

  final ITrainingRepository weightRepository;

  @override
  Future<int> execute(String userId, String id) {
    return weightRepository.delete(userId, id);
  }
}
