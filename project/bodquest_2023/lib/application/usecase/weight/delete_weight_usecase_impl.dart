import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/weight/delete_weight_usecase.dart';

class DeleteWeightUsecaseImpl implements IDeleteWeightUsecase {
  DeleteWeightUsecaseImpl({
    required IWeightRepository repository,
  }) : weightRepository = repository;

  final IWeightRepository weightRepository;

  @override
  Future<int> execute(String userId, String id) {
    return weightRepository.delete(userId, id);
  }
}
