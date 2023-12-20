import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/datasource/firebase_auth_user_datasource.dart';
import '../../infrastructure/datasource/firestore_users_datasource.dart';
import '../../infrastructure/repository/user_repository_impl.dart';
import '../entity/user.dart';
import '../factory/user_factory.dart';

final userRepositoryProvider = Provider<IUserRepository>(
  (ref) => UserRepositoryImpl(
    fireStoreDataSource: ref.watch(fireStoreUsersDataSourceProvider),
    firebaseDataSource: ref.watch(firebaseAuthUserDataSourceProvider),
    factory: ref.watch(userFactoryProvider),
  ),
);

abstract interface class IUserRepository {
  /// ユーザー一覧の取得
  Future<List<User>> findAll();
  Future<User> getLogInUser();
}
