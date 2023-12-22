import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain_module.dart';
import '../../../domain/usecase/user/get_users_usecase.dart';
import '../../state/user/user_state.dart';

final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<UserState>>>(
  (ref) => UserListNotifier(
    getUsersUsecase: ref.read(getUsersUsecaseProvider),
  ),
);

class UserListNotifier extends StateNotifier<AsyncValue<List<UserState>>> {
  UserListNotifier({required IGetUsersUsecase getUsersUsecase})
      : _getUsersUsecase = getUsersUsecase,
        super(const AsyncLoading()) {
    _fetch();
  }

  final IGetUsersUsecase _getUsersUsecase;

  /// ユーザー一覧の同期
  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final res = await _getUsersUsecase.execute();
      return res.map((e) => UserState.fromEntity(e)).toList();
    });
  }
}
