import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/update_weight_usecase.dart';

class UpdateWeightUsecaseImpl implements IUpdateWeightUsecase {
  UpdateWeightUsecaseImpl({
    required IWeightRepository repository,
  }) : weightRepository = repository;

  final IWeightRepository weightRepository;

  @override
  Future<int> execute(String userId, String id, DateTime date, double value) {
    return weightRepository.update(userId, id, date, value);
  }
}
