abstract interface class IUpdateTrainingUsecase {
  Future<int> execute(
    String userId,
    String id,
    String kind,
    DateTime date,
    int value,
  );
}
