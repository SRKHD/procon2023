import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/add_weight_usecase.dart';

class AddWeightUsecaseImpl implements IAddWeightUsecase {
  AddWeightUsecaseImpl({
    required IWeightRepository repository,
  }) : _repository = repository;

  final IWeightRepository _repository;

  @override
  Future<int> execute(
    String userId,
    DateTime date,
    double value,
  ) {
    return _repository.add(userId, date, value);
  }
}
