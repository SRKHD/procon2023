import '../../model/firestore/user/fug_user_login.dart';

abstract interface class IFirebaseAuthUserDataSource {
  Future<FugUserLogin> getLoginUser();
}
