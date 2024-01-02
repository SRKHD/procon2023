abstract interface class IUpdateWeightUsecase {
  Future<int> execute(
    String userId,
    String id,
    DateTime date,
    double value,
  );
}
