import '../../domain/entity/user.dart';
import '../../domain/factory/user/user_factory.dart';
import '../../domain/repository/user_repository.dart';
import '../../domain/value/user_gender.dart';
import '../datasource/interface/firebase_auth/user_datasource.dart';
import '../datasource/interface/firestore/users_datasource.dart';

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl({
    required this.fireStoreDataSource,
    required this.firebaseDataSource,
    required IUserFactory factory,
  }) : userFactory = factory;
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
  Future<User> getLogInUser() async {
    // firebaseからIDを取得→IDを基にfirestoreからユーザー情報を取得
    final userid = await firebaseDataSource.getLoginUser();
    final fuguser = await fireStoreDataSource.getLoginUser(userid.uuid);

    return userFactory.createFromModel(fuguser.result);
  }

  @override
  Future<int> addUser(String userId) {
    return fireStoreDataSource.addUser(userId);
  }

  @override
  Future<int> updateUserInfo(String userId, String userName, DateTime birthday,
      double height, String gender) {
    return fireStoreDataSource.updateUserInfo(
        userId, userName, birthday, height, gender);
  }
}
