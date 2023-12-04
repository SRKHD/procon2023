import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/factory/user_factory_impl.dart';
import '../../infrastructure/model/firestore/rug_user.dart';
import '../entity/user.dart';
import 'user_gender_factory.dart';

final userFactoryProvider = Provider<IUserFactory>(
  (ref) => UserFactoryImpl(
    factory: ref.watch(userGenderFactoryProvider),
  ),
);

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
