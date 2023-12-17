import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/user.dart';

part 'loginuser_state.freezed.dart';

@freezed
class LogInUserState with _$LogInUserState {
  factory LogInUserState({
    required String userId,
    required String userName,
  }) = _LogInUserState;

  factory LogInUserState.fromEntity(User user) {
    return LogInUserState(
      userId: user.id,
      userName: user.name,
    );
  }
}
