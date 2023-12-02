import '../../domain/entity/user.dart';
import '../../domain/factory/user_factory.dart';
import '../../domain/factory/user_gender_factory.dart';
import '../model/firestore/rug_user.dart';

class UserFactoryImpl implements IUserFactory {
  UserFactoryImpl({
    required IUserGenderFactory factory,
  }) : genderFactory = factory;
  final IUserGenderFactory genderFactory;

  @override
  User create({
    required String name,
    required String gender,
    required String thumbnail,
    required DateTime birthday,
  }) {
    return User(
      id: '12345', // uuid等で自動で生成する
      name: name,
      gender: genderFactory.create(gender),
      thumbnail: thumbnail,
      birthday: birthday,
    );
  }

  @override
  User createFromModel(RugUser user) {
    return User(
      id: user.login.uuid,
      name: '${user.name.title} ${user.name.first} ${user.name.last}',
      gender: genderFactory.createFromModel(user.gender),
      thumbnail: user.picture.thumbnail,
      birthday: user.dob.date,
    );
  }
}
