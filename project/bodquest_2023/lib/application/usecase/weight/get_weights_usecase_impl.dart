import '../../../domain/entity/weight.dart';
import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/get_weights_usecase.dart';

class GetWeightsUsecaseImpl implements IGetWeightsUsecase {
  final IWeightRepository _repository;

  GetWeightsUsecaseImpl({
    required IWeightRepository repository,
  }) : _repository = repository;

  @override
  Stream<List<Weight>> execute(String userId) {
    return _repository.get(userId);
  }
}
