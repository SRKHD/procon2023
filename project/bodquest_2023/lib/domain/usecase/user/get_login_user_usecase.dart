import '../../entity/user.dart';

/// ログインユーザーを取得する
abstract interface class IGetLogInUserUsecase {
  Future<User> execute();
}
