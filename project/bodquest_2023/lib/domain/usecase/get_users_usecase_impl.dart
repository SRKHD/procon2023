import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/usecase/get_users_usecase_impl.dart';
import '../entity/user.dart';
import '../repository/user_repository.dart';

final getUsersUsecaseProvider = Provider<IGetUsersUsecase>(
  (ref) => GetUsersUsecaseImpl(
    userRepository: ref.watch(userRepositoryProvider),
  ),
);

/// ユーザー一覧を取得する
abstract interface class IGetUsersUsecase {
  Future<List<User>> execute();
}
