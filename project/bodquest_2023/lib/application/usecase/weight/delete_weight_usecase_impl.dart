import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/delete_weight_usecase.dart';

class DeleteWeightUsecaseImpl implements IDeleteWeightUsecase {
  DeleteWeightUsecaseImpl({
    required IWeightRepository repository,
  }) : _repository = repository;

  final IWeightRepository _repository;

  @override
  Future<int> execute(String userId, String id) {
    return _repository.delete(userId, id);
  }
}
