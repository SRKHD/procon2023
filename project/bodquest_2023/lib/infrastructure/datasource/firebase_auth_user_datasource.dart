import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/firestore/rug_user_login.dart';
import 'firebase_auth_user_datasource_impl.dart';

final firebaseAuthUserDataSourceProvider =
    Provider<IFirebaseAuthUserDataSource>(
  (ref) => FirebaseAuthUserDataSourceImpl(),
);

abstract interface class IFirebaseAuthUserDataSource {
  Future<RugUserLogin> getLoginUser();
}
