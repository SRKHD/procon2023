import '../../../entity/meal.dart';
import '../../../repository/meal_repository.dart';
import '../../../usecase/meal/get_meals_usecase.dart';

class GetMealsUsecaseImpl implements IGetMealsUsecase {
  final IMealRepository weightRepository;

  GetMealsUsecaseImpl({
    required IMealRepository repository,
  }) : weightRepository = repository;

  @override
  Stream<List<Meal>> execute(String userId) {
    return weightRepository.findAll(userId);
  }
}
