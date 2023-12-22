import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/factory/user_factory.dart';
import '../domain/repository/user_repository.dart';
import 'datasource/firebase_auth/user_datasource.dart';
import 'datasource/firestore/users_datasource.dart';
import 'repository/user_repository_impl.dart';

///
/// User

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRepositoryImpl(
      fireStoreDataSource: ref.watch(fireStoreUsersDataSourceProvider),
      firebaseDataSource: ref.watch(firebaseAuthUserDataSourceProvider),
      factory: ref.watch(userFactoryProvider));
});
