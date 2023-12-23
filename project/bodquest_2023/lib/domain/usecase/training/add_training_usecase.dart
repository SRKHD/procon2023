abstract interface class IAddTrainingUsecase {
  Future<int> execute(
    String userId,
    String kind,
    DateTime date,
    int value,
  );
}
