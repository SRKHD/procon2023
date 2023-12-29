import '../../../domain/entity/user.dart';
import '../../../domain/factory/user/user_factory.dart';
import '../../../domain/factory/user/user_gender_factory.dart';
import '../../model/firestore/user/fug_user.dart';

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
    required double targetWeight,
    required double height,
  }) {
    return User(
      id: '12345', // uuid等で自動で生成する
      name: name,
      gender: genderFactory.create(gender),
      thumbnail: thumbnail,
      birthday: birthday,
      targetWeight: targetWeight,
      height: height,
    );
  }

  @override
  User createFromModel(FugUser user) {
    return User(
      id: user.login.uuid,
      name: '${user.name.title} ${user.name.first} ${user.name.last}',
      gender: genderFactory.createFromModel(user.gender),
      thumbnail: user.picture.thumbnail,
      birthday: user.dob.date,
      targetWeight: user.targetWeight,
      height: user.height,
    );
  }
}
