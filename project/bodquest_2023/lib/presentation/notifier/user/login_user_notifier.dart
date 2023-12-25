import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../state/user/loginuser_state.dart';

class LogInUserNotifier extends StateNotifier<LogInUserState> {
  LogInUserNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        super(LogInUserState(userId: '', userName: '')) {
    _fetch();
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;

  /// ログインユーザーの同期
  Future<void> _fetch() async {
    final user = await _getLogInUserUsecase.execute();
    state = LogInUserState(userId: user.id, userName: user.name);
    //state = _getLogInUserUsecase.execute();
  }
}
