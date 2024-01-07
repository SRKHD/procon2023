import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginuser_state.freezed.dart';

@freezed
class LogInUserState with _$LogInUserState {
  factory LogInUserState({
    required String userId,
    required String userName,
    required double userHeight,
    required String userGender,
    required String userBirthday,
  }) = _LogInUserState;
}
