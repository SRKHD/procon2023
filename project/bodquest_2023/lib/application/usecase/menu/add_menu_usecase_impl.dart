import '../../../domain/repository/menu_repository.dart';
import '../../../domain/usecase/menu/add_menu_usecase.dart';

class AddMenuUsecaseImpl implements IAddMenuUsecase {
  final IMenuRepository menuRepository;

  AddMenuUsecaseImpl({
    required IMenuRepository repository,
  }) : menuRepository = repository;

  @override
  Future<int> execute(
    String userId,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    String imageFilePath,
  ) {
    return menuRepository.addMenu(
        userId, name, date, recipe, ingredient, calorie, imageFilePath);
  }
}
