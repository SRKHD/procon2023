import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/exception/network_exception.dart';
import '../../../model/firestore/user/fug_get_user_response.dart';
import '../../../model/firestore/user/fug_get_users_response.dart';
import '../../../model/firestore/user/fug_user.dart';
import '../../interface/firestore/users_datasource.dart';

class FirestoreUsersDataSourceImpl implements IFirestoreUsersDataSource {
  @override
  Future<FugGetUsersResponse> getUsers({int results = 10}) async {
    final usersRef = FirebaseFirestore.instance.collection('users');

    FugGetUsersResponse result = FugGetUsersResponse(results: []);
    try {
      final querySnapshot = await usersRef.get();

      List<FugUser> userList = querySnapshot.docs
          .map((doc) {
            return FugGetUsersResponse.fromJson(doc.data()).results;
        })
          .expand((userList) => userList)
          .toList();

      result =
          FugGetUsersResponse(results: userList); // リストをFugGetUsersResponseにセット
    } catch (e) {
      print(e);
      throw NetworkException('FirestoreUsersDataSourceImpl getUsers() "/"');
    }
    return result;
  }

  @override
  Future<FugGetUserResponse> getLoginUser(String userId) async {
    late FugGetUserResponse result;
    try {
      var userRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userRef.exists) {
        result = FugGetUserResponse.fromJson(userRef.data());
      } else {
        throw NetworkException('FirestoreUsersDataSourceImpl getUsers() "/"');
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  @override
  Future<int> addUser(String userId) async {
    await FirebaseFirestore.instance
        .collection('users') // コレクションID
        .doc(userId) // ドキュメントID = ユーザーID
        .set({
      'userId': userId,
      'userName': '',
      'height': 0,
      'gender': '',
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
