import '../../../entity/user.dart';
import '../../../repository/user_repository.dart';
import '../../../usecase/user/get_users_usecase.dart';

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
