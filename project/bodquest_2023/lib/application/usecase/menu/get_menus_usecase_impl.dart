import '../../../domain/entity/menu.dart';
import '../../../domain/repository/menu_repository.dart';
import '../../../domain/usecase/menu/get_menus_usecase.dart';

class GetMenusUsecaseImpl implements IGetMenusUsecase {
  final IMenuRepository menuRepository;

  GetMenusUsecaseImpl({
    required IMenuRepository repository,
  }) : menuRepository = repository;

  @override
  Stream<List<Menu>> execute(String userId) {
    return menuRepository.findAll(userId);
  }
}
