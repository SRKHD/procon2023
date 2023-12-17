import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/usecase/get_login_user_usecase_impl.dart';
import '../entity/user.dart';
import '../repository/user_repository.dart';

final getLogInUserUsecaseProvider = Provider<IGetLogInUserUsecase>(
  (ref) => GetLogInUserUsecaseImpl(
    userRepository: ref.watch(userRepositoryProvider),
  ),
);

/// ログインユーザーを取得する
abstract interface class IGetLogInUserUsecase {
  Future<User> execute();
}
