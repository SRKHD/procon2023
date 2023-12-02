import '../entity/user.dart';

/// ユーザー一覧を取得する
abstract interface class IGetUsersUsecase {
  Future<List<User>> execute();
}
