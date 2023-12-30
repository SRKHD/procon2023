import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    required String name,
    required String thumbnailLink,
    required String birthday,
    required double height,
  }) = _UserState;

  factory UserState.fromEntity(User user) {
    return UserState(
      name: user.name,
      thumbnailLink: user.thumbnail,
      birthday:
          '${user.birthday.year}年${user.birthday.month}月${user.birthday.day}日',
      height: user.height,
    );
  }
}
