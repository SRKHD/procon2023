import '../../../domain/repository/user_repository.dart';
import '../../../domain/usecase/user/update_user_info_usecase.dart';

class UpdateUserInfoUsecaseImpl implements IUpdateUserInfoUsecase {
  final IUserRepository userRepository;

  UpdateUserInfoUsecaseImpl({
    required IUserRepository repository,
  }) : userRepository = repository;

  @override
  Future<int> execute(
      String userId, String userName, DateTime birthday, double height) {
    return userRepository.updateUserInfo(userId, userName, birthday, height);
  }
}
