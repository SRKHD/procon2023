import '../../../domain/factory/user/user_gender_factory.dart';
import '../../../domain/value/user_gender.dart';
import '../../model/firestore/user/rug_user_gender.dart';

class UserGenderFactoryImpl implements IUserGenderFactory {
  @override
  UserGender create(String value) {
    switch (value) {
      case 'male':
        return UserGender.male;
      case 'female':
        return UserGender.female;
      case 'other':
        return UserGender.other;
      default:
        throw ArgumentError();
    }
  }

  @override
  UserGender createFromModel(RugUserGender gender) {
    switch (gender) {
      case RugUserGender.male:
        return UserGender.male;
      case RugUserGender.female:
        return UserGender.female;
      default:
        return UserGender.other;
    }
  }
}
