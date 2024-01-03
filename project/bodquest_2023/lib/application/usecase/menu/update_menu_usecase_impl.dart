import '../../../domain/repository/menu_repository.dart';
import '../../../domain/usecase/menu/update_menu_usecase.dart';

class UpdateMenuUsecaseImpl implements IUpdateMenuUsecase {
  UpdateMenuUsecaseImpl({
    required IMenuRepository repository,
  }) : _repository = repository;

  final IMenuRepository _repository;

  @override
  Future<int> execute(String userId, String id, String name, DateTime date,
      String recipe, String ingredient, int calorie, String imageFilePath) {
    return _repository.update(
        userId, id, name, date, recipe, ingredient, calorie, imageFilePath);
  }
}
