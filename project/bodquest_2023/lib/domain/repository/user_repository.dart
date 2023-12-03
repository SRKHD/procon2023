import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/datasource/firestore_datasource.dart';
import '../../infrastructure/repository/user_repository_impl.dart';
import '../entity/user.dart';
import '../factory/user_factory.dart';

final userRepositoryProvider = Provider<IUserRepository>(
  (ref) => UserRepositoryImpl(
    dataSource: ref.watch(fireStoreDataSourceProvider),
    factory: ref.watch(userFactoryProvider),
  ),
);

abstract interface class IUserRepository {
  /// ユーザー一覧の取得
  Future<List<User>> findAll();
}
