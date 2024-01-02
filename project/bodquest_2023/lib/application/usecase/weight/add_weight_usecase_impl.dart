import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/add_weight_usecase.dart';

class AddWeightUsecaseImpl implements IAddWeightUsecase {
  AddWeightUsecaseImpl({
    required IWeightRepository repository,
  }) : weightRepository = repository;

  final IWeightRepository weightRepository;

  @override
  Future<int> execute(
    String userId,
    DateTime date,
    double value,
  ) {
    return weightRepository.add(userId, date, value);
  }
}
