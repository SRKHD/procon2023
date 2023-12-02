import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../../domain/usecase/user_repository.dart';

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
