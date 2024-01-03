import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/user/loginuser_state.dart';
import '../../usecaese_provider_module.dart';
import '../../notifier/user/login_user_notifier.dart';

final logInUserNotifierProvider =
    StateNotifierProvider<LogInUserNotifier, LogInUserState>(
  (ref) => LogInUserNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
  ),
);
