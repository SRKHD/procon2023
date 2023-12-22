/// ユーザー一覧を取得する
abstract interface class IAddWeightUsecase {
  Future<int> execute(
    String userId,
    DateTime date,
    double value,
  );
}
