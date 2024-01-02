abstract interface class IDeleteWeightUsecase {
  Future<int> execute(
    String userId,
    String id,
  );
}
