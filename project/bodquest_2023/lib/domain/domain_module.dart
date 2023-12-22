import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/usecase/get_login_user_usecase_impl.dart';
import 'application/usecase/get_users_usecase_impl.dart';
import '../infrastructure/data_module.dart';
import 'usecase/get_login_user_usecase.dart';
import 'usecase/get_users_usecase.dart';

final getUsersUsecaseProvider = Provider<IGetUsersUsecase>(
  (ref) => GetUsersUsecaseImpl(
    userRepository: ref.watch(userRepositoryProvider),
  ),
);

final getLogInUserUsecaseProvider = Provider<IGetLogInUserUsecase>(
  (ref) => GetLogInUserUsecaseImpl(
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
