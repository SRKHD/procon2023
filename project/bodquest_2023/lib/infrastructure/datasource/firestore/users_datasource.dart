import '../../model/firestore/user/fug_get_users_response.dart';

abstract interface class IFirestoreUsersDataSource {
  Future<FugGetUsersResponse> getUsers({int results});
  Future<int> addUser(String userId);
  Future<int> updateUserInfo(String userId, String userName, DateTime birthday);
}
