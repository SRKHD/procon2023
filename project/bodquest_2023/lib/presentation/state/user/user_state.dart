import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/util/datetime_utils.dart';
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
      birthday: toJPNDateString(user.birthday),
      height: user.height,
    );
  }
}
