import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../../domain/usecase/get_users_usecase_impl.dart';

class GetUsersUsecaseImpl implements IGetUsersUsecase {
  final IUserRepository _userRepository;

  GetUsersUsecaseImpl({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<User>> execute() async {
    return await _userRepository.findAll();
  }
}
