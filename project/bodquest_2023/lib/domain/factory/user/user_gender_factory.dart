import '../../../infrastructure/model/firestore/user/rug_user_gender.dart';
import '../../value/user_gender.dart';

abstract interface class IUserGenderFactory {
  /// [UserGender]を生成する
  UserGender create(String value);

  /// [RugUserGender]から[UserGender]を生成する
  UserGender createFromModel(RugUserGender gender);
}
