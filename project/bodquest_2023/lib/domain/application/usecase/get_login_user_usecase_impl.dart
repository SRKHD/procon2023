import '../../entity/user.dart';
import '../../repository/user_repository.dart';
import '../../usecase/get_login_user_usecase.dart';

class GetLogInUserUsecaseImpl implements IGetLogInUserUsecase {
  final IUserRepository _userRepository;

  GetLogInUserUsecaseImpl({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User> execute() async {
    return await _userRepository.getLogInUser();
  }
}
