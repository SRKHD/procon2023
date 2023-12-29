import '../../../domain/repository/meal_repository.dart';
import '../../../domain/usecase/meal/add_meal_usecase.dart';

class AddMealUsecaseImpl implements IAddMealUsecase {
  final IMealRepository weightRepository;

  AddMealUsecaseImpl({
    required IMealRepository repository,
  }) : weightRepository = repository;

  @override
  Future<int> execute(
    String userId,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  ) {
    return weightRepository.addMeal(userId, name, date, calorie, imageFilePath);
  }
}
