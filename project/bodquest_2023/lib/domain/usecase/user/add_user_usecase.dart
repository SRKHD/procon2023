/// ユーザー一覧を取得する
abstract interface class IAddUserUsecase {
  Future<int> execute(String userId);
}
