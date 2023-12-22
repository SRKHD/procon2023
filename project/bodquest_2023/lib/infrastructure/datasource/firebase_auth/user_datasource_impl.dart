import 'package:firebase_auth/firebase_auth.dart';

import '../../model/firestore/user/rug_user_login.dart';
import 'user_datasource.dart';

class FirebaseAuthUserDataSourceImpl implements IFirebaseAuthUserDataSource {
  @override
  Future<RugUserLogin> getLoginUser() {
    final currentUser = FirebaseAuth.instance.currentUser;
    final isLogin = currentUser != null;
    final uid =
        isLogin ? currentUser.uid.toString() : 'tYWPnnG8N0eFGREBP6Io4N5q1Cx2';

    String userName = 'no login user';
    if (isLogin) {
      userName = currentUser.displayName == null
          ? 'no displayName'
          : currentUser.displayName!;
    }
    return Future.value(RugUserLogin(uuid: uid, username: userName));
  }
}
