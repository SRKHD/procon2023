import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/synchronize_healthia_weights_usecase.dart';

class SynchronizeHealthiaWeightsUsecaseImpl
    implements ISynchronizeHealthiaWeightsUsecase {
  SynchronizeHealthiaWeightsUsecaseImpl({
    required IWeightRepository repository,
  }) : weightRepository = repository;

  final IWeightRepository weightRepository;

  @override
  Future<int> execute(String userId, DateTime date) {
    return weightRepository.synchronizeHealthiaWeights(userId, date);
  }
}
