import 'dart:typed_data';

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
    String kind,
    String name,
    DateTime date,
    int calorie,
    Uint8List? imageData,
  ) {
    return mealRepository.add(userId, kind, name, date, calorie, imageData);
  }
}
