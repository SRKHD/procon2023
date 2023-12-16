import 'package:bodquest_2023/infrastructure/datasource/firebase_auth_user_datasource.dart';

import '../../domain/entity/user.dart';
import '../../domain/factory/user_factory.dart';
import '../../domain/repository/user_repository.dart';
import '../../domain/value/user_gender.dart';
import '../datasource/firestore_users_datasource.dart';

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl({
    required IFirestoreUsersDataSource fireStoreDataSource,
    required IFirebaseAuthUserDataSource firebaseDataSource,
    required IUserFactory factory,
  })  : fireStoreDataSource = fireStoreDataSource,
        firebaseDataSource = firebaseDataSource,
        userFactory = factory;
  final IFirestoreUsersDataSource fireStoreDataSource;
  final IFirebaseAuthUserDataSource firebaseDataSource;
  final IUserFactory userFactory;

  @override
  Future<List<User>> findAll() async {
    try {
      final res = await fireStoreDataSource.getUsers();
      return res.results
          .map(
            (e) => userFactory.createFromModel(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getLogInUser() {
    return firebaseDataSource.getLoginUser().then((value) => Future.value(User(
        id: value.uuid,
        name: value.username,
        gender: UserGender.other,
        thumbnail: "thumbnail",
        birthday: DateTime.now())));
  }
}
