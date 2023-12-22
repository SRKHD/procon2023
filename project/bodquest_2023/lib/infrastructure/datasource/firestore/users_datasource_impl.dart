import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/exception/network_exception.dart';
import '../../model/firestore/user/rug_get_users_response.dart';
import 'users_datasource.dart';

class FirestoreUsersDataSourceImpl implements IFirestoreUsersDataSource {
  @override
  Future<RugGetUsersResponse> getUsers({int results = 10}) async {
    final usersRef = FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc();

    RugGetUsersResponse result = RugGetUsersResponse(results: []);
    usersRef.get().then((docSnapshot) => {
          if (docSnapshot.exists)
            {result = RugGetUsersResponse.fromJson(docSnapshot.data())}
          else
            {
              throw NetworkException(
                  'FirestoreUsersDataSourceImpl getUsers() "/"')
            }
        });
    return result;
  }
}
