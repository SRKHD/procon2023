import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/factory/user_gender_factory_impl.dart';
import '../../infrastructure/model/firestore/rug_user_gender.dart';
import '../value/user_gender.dart';

final userGenderFactoryProvider = Provider<IUserGenderFactory>(
  (ref) => UserGenderFactoryImpl(),
);

abstract interface class IUserGenderFactory {
  /// [UserGender]を生成する
  UserGender create(String value);

  /// [RugUserGender]から[UserGender]を生成する
  UserGender createFromModel(RugUserGender gender);
}
