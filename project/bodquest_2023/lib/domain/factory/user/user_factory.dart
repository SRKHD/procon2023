import '../../../infrastructure/model/firestore/user/fug_user.dart';
import '../../entity/user.dart';

abstract interface class IUserFactory {
  /// [User]を生成する
  User create({
    required String name,
    required String gender,
    required String thumbnail,
    required DateTime birthday,
    required double targetWeight,
    required double height,
  });

  /// [FugUser]から[User]を生成する
  User createFromModel(FugUser user);
}
