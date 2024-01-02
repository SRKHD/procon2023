abstract interface class IDeleteTrainingUsecase {
  Future<int> execute(
    String userId,
    String id,
  );
}
