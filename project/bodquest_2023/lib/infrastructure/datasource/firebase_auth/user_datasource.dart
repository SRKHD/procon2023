import '../../model/firestore/user/rug_user_login.dart';

abstract interface class IFirebaseAuthUserDataSource {
  Future<RugUserLogin> getLoginUser();
}
