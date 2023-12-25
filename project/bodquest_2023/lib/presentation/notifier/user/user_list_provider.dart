import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/user/user_state.dart';
import '../../usecaese_provider_module.dart';
import 'user_list_notifier.dart';

final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<UserState>>>(
  (ref) => UserListNotifier(
    getUsersUsecase: ref.read(getUsersUsecaseProvider),
    addUserUsecase: ref.read(addUserUsecaseProvider),
  ),
);
