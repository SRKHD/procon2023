import '../../../domain/repository/meal_repository.dart';
import '../../../domain/usecase/meal/add_meal_usecase.dart';

class AddMealUsecaseImpl implements IAddMealUsecase {
  final IMealRepository mealRepository;

  AddMealUsecaseImpl({
    required IMealRepository repository,
  }) : mealRepository = repository;

  @override
  Future<int> execute(
    String userId,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  ) {
    return mealRepository.add(userId, name, date, calorie, imageFilePath);
  }
}
