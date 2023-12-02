import '../../domain/entity/user.dart';

abstract interface class IUserRepository {
  /// ユーザー一覧の取得
  Future<List<User>> findAll();
}
