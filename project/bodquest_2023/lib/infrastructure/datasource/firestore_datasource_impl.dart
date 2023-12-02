import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/exception/network_exception.dart';
import '../model/firestore/rug_get_users_response.dart';
import 'firestore_datasource.dart';

class FirestoreDataSourceImpl implements IFirestoreDataSource {
  @override
  Future<RugGetUsersResponse> getUsers({int results = 10}) async {
    const userId = 'srkhd.2023@gmail.com';
    final usersRef = FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc(userId);

    RugGetUsersResponse result = RugGetUsersResponse(results: []);
    usersRef.get().then((docSnapshot) => {
          if (docSnapshot.exists)
            {result = RugGetUsersResponse.fromJson(docSnapshot.data())}
          else
            {throw NetworkException('FirestoreDataSourceImpl getUsers() "/"')}
        });
    return result;
  }
}
