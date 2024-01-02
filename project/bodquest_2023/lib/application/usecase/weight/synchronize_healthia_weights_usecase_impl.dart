import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/synchronize_healthia_weights_usecase.dart';

class SynchronizeHealthiaWeightsUsecaseImpl
    implements ISynchronizeHealthiaWeightsUsecase {
  SynchronizeHealthiaWeightsUsecaseImpl({
    required IWeightRepository repository,
  }) : _repository = repository;

  final IWeightRepository _repository;

  @override
  Future<int> execute(String userId, DateTime date) {
    return _repository.synchronizeHealthia(userId, date);
  }
}
