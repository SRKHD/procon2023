import '../../model/firestore/user/rug_get_users_response.dart';

abstract interface class IFirestoreUsersDataSource {
  Future<RugGetUsersResponse> getUsers({int results});
  Future<int> addUser(String userId);
  Future<int> updateUserInfo(String userId, String userName, DateTime birthday);
}
