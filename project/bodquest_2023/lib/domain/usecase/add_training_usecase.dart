/// ユーザー一覧を取得する
abstract interface class IAddTrainingUsecase {
  Future<int> execute(
    String userId,
    String kind,
    DateTime date,
    int value,
  );
}
