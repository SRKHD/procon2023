import '../../../infrastructure/model/firestore/user/fug_user_gender.dart';
import '../../value/user_gender.dart';

abstract interface class IUserGenderFactory {
  /// [UserGender]を生成する
  UserGender create(String value);

  /// [FugUserGender]から[UserGender]を生成する
  UserGender createFromModel(FugUserGender gender);
}
