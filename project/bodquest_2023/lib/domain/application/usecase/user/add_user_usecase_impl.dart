import '../../../repository/user_repository.dart';
import '../../../usecase/user/add_user_usecase.dart';

class AddUserUsecaseImpl implements IAddUserUsecase {
  final IUserRepository userRepository;

  AddUserUsecaseImpl({
    required IUserRepository repository,
  }) : userRepository = repository;

  @override
  Future<int> execute(String userId) {
    return userRepository.addUser(userId);
  }
}
