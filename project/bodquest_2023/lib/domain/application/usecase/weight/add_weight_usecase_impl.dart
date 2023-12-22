import '../../../repository/weight_repository.dart';
import '../../../usecase/weight/add_weight_usecase.dart';

class AddWeightUsecaseImpl implements IAddWeightUsecase {
  final IWeightRepository weightRepository;

  AddWeightUsecaseImpl({
    required IWeightRepository repository,
  }) : weightRepository = repository;

  @override
  Future<int> execute(
    String userId,
    DateTime date,
    double value,
  ) {
    return weightRepository.addWeight(userId, date, value);
  }
}
