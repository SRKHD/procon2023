import '../../../domain/entity/meal.dart';
import '../../../domain/repository/meal_repository.dart';
import '../../../domain/usecase/meal/get_meals_usecase.dart';

class GetMealsUsecaseImpl implements IGetMealsUsecase {
  final IMealRepository mealRepository;

  GetMealsUsecaseImpl({
    required IMealRepository repository,
  }) : mealRepository = repository;

  @override
  Stream<List<Meal>> execute(String userId) {
    return mealRepository.get(userId);
  }
}
