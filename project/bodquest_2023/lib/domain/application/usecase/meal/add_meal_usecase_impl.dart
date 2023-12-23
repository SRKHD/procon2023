import '../../../repository/meal_repository.dart';
import '../../../usecase/meal/add_meal_usecase.dart';

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
  ) {
    return weightRepository.addMeal(userId, name, date, calorie);
  }
}
