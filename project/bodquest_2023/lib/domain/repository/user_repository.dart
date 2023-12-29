import '../entity/user.dart';

abstract interface class IUserRepository {
  /// ユーザー一覧の取得
  Future<List<User>> findAll();
  Future<User> getLogInUser();
  Future<int> addUser(String userId);
  Future<int> updateUserInfo(
      String userId, String userName, DateTime birthday, double height);
}
