abstract interface class ISynchronizeHealthiaWeightsUsecase {
  Future<int> execute(
    String userId,
    DateTime date,
  );
}
