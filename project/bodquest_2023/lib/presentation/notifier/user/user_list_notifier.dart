import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/user/add_user_usecase.dart';
import '../../../domain/usecase/user/get_users_usecase.dart';
import '../../../domain/usecase/user/update_user_info_usecase.dart';
import '../../state/user/user_state.dart';

class UserListNotifier extends StateNotifier<AsyncValue<List<UserState>>> {
  UserListNotifier(
      {required IGetUsersUsecase getUsersUsecase,
      required IAddUserUsecase addUserUsecase,
      required IUpdateUserInfoUsecase updateUserInfoUsecase})
      : _getUsersUsecase = getUsersUsecase,
        _addUserUsecase = addUserUsecase,
        _updateUserInfoUsecase = updateUserInfoUsecase,
        super(const AsyncLoading()) {
    _fetch();
  }

  final IGetUsersUsecase _getUsersUsecase;
  final IAddUserUsecase _addUserUsecase;
  final IUpdateUserInfoUsecase _updateUserInfoUsecase;

  /// ユーザー一覧の同期
  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final res = await _getUsersUsecase.execute();
      return res.map((e) => UserState.fromEntity(e)).toList();
    });
  }

  void addUser(String userId) {
    _addUserUsecase.execute(userId);
  }

  void updateUserInfo(String userId, String userName, DateTime birthday,
      double height, String gender) {
    _updateUserInfoUsecase.execute(userId, userName, birthday, height, gender);
  }
}
