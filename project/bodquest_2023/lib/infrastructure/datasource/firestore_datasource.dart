import '../model/firestore/rug_get_users_response.dart';

abstract interface class IFirestoreDataSource {
  Future<RugGetUsersResponse> getUsers({int results});
}
