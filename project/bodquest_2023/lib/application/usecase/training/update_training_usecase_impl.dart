import '../../../domain/repository/training_repository.dart';
import '../../../domain/usecase/training/update_training_usecase.dart';

class UpdateTrainingUsecaseImpl implements IUpdateTrainingUsecase {
  UpdateTrainingUsecaseImpl({
    required ITrainingRepository repository,
  }) : weightRepository = repository;

  final ITrainingRepository weightRepository;

  @override
  Future<int> execute(
      String userId, String id, String kind, DateTime date, int value) {
    return weightRepository.update(userId, id, kind, date, value);
  }
}
