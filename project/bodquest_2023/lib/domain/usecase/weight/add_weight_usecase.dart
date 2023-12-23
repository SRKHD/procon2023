abstract interface class IAddWeightUsecase {
  Future<int> execute(
    String userId,
    DateTime date,
    double value,
  );
}
