import '../../../domain/repository/meal_repository.dart';
import '../../../domain/usecase/meal/delete_meal_usecase.dart';

class DeleteMealUsecaseImpl implements IDeleteMealUsecase {
  DeleteMealUsecaseImpl({
    required IMealRepository repository,
  }) : _repository = repository;

  final IMealRepository _repository;

  @override
  Future<int> execute(String userId, String id) {
    return _repository.delete(userId, id);
  }
}
