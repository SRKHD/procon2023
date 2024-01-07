import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/exception/network_exception.dart';
import '../../../model/firestore/user/fug_get_users_response.dart';
import '../../interface/firestore/users_datasource.dart';

class FirestoreUsersDataSourceImpl implements IFirestoreUsersDataSource {
  @override
  Future<FugGetUsersResponse> getUsers({int results = 10}) async {
    final usersRef = FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc();

    FugGetUsersResponse result = FugGetUsersResponse(results: []);
    usersRef
        .get()
        .then((docSnapshot) {
          if (docSnapshot.exists) {
            result = FugGetUsersResponse.fromJson(docSnapshot.data());
          } else {
            throw NetworkException(
                'FirestoreUsersDataSourceImpl getUsers() "/"');
          }
        })
        .catchError((e) => print(e))
        .whenComplete(() => print('get user complete'));
    return result;
  }

  @override
  Future<int> addUser(String userId) async {
    await FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc(userId) // ドキュメントID = ユーザーID
        .set({
      'userId': userId,
    }); // データ
    return 0;
  }

  @override
  Future<int> updateUserInfo(String userId, String userName, DateTime birthday,
      double height, String gender) async {
    await FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc(userId) // ドキュメントID
        .set({
      'userId': userId,
      'userName': userName,
      'birthday': Timestamp.fromDate(birthday),
      'height': height,
      'gender': gender,
    }); // データ
    return 0;
  }
}
