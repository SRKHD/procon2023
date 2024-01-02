import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/update_weight_usecase.dart';

class UpdateWeightUsecaseImpl implements IUpdateWeightUsecase {
  UpdateWeightUsecaseImpl({
    required IWeightRepository repository,
  }) : _repository = repository;

  final IWeightRepository _repository;

  @override
  Future<int> execute(String userId, String id, DateTime date, double value) {
    return _repository.update(userId, id, date, value);
  }
}
