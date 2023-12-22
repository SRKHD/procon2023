import '../../../entity/weight.dart';
import '../../../repository/weight_repository.dart';
import '../../../usecase/weight/get_weights_usecase.dart';

class GetWeightsUsecaseImpl implements IGetWeightsUsecase {
  final IWeightRepository weightRepository;

  GetWeightsUsecaseImpl({
    required IWeightRepository repository,
  }) : weightRepository = repository;

  @override
  Stream<List<Weight>> execute(String userId) {
    return weightRepository.findAll(userId);
  }
}
