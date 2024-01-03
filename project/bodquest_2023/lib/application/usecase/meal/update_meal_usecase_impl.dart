import '../../../domain/repository/meal_repository.dart';
import '../../../domain/usecase/meal/update_meal_usecase.dart';

class UpdateMealUsecaseImpl implements IUpdateMealUsecase {
  UpdateMealUsecaseImpl({
    required IMealRepository repository,
  }) : _repository = repository;

  final IMealRepository _repository;

  @override
  Future<int> execute(String userId, String id, String name, DateTime date,
      int calorie, String imageFilePath) {
    return _repository.update(userId, id, name, date, calorie, imageFilePath);
  }
}
