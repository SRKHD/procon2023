import '../../../domain/repository/menu_repository.dart';
import '../../../domain/usecase/menu/delete_menu_usecase.dart';

class DeleteMenuUsecaseImpl implements IDeleteMenuUsecase {
  DeleteMenuUsecaseImpl({
    required IMenuRepository repository,
  }) : _repository = repository;

  final IMenuRepository _repository;

  @override
  Future<int> execute(String userId, String id) {
    return _repository.delete(userId, id);
  }
}
