import '../../domain/entity/weight.dart';
import '../../domain/repository/weight_repository.dart';
import '../../domain/usecase/get_weights_usecase_impl.dart';

class GetWeightsUsecaseImpl implements IGetWeightsUsecase {
  final IWeightRepository weightRepository;

  GetWeightsUsecaseImpl({
    required IWeightRepository repository,
  }) : weightRepository = repository;

  @override
  Future<List<Weight>> execute() async {
    return await weightRepository.findAll();
  }
}