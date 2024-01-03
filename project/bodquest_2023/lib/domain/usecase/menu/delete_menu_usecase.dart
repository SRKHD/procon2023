abstract interface class IDeleteMenuUsecase {
  Future<int> execute(
    String userId,
    String id,
  );
}
