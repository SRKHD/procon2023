import '../../../infrastructure/model/firestore/user/rug_user.dart';
import '../../entity/user.dart';

abstract interface class IUserFactory {
  /// [User]を生成する
  User create({
    required String name,
    required String gender,
    required String thumbnail,
    required DateTime birthday,
  });

  /// [RugUser]から[User]を生成する
  User createFromModel(RugUser user);
}
