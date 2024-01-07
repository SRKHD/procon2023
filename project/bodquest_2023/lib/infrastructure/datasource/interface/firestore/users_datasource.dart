import '../../../model/firestore/user/fug_get_user_response.dart';
import '../../../model/firestore/user/fug_get_users_response.dart';

abstract interface class IFirestoreUsersDataSource {
  Future<FugGetUsersResponse> getUsers({int results});
  Future<FugGetUserResponse> getLoginUser(String userId);
  Future<int> addUser(String userId);
  Future<int> updateUserInfo(String userId, String userName, DateTime birthday,
      double height, String gender);
}
