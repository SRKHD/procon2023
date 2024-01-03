abstract interface class IDeleteMealUsecase {
  Future<int> execute(
    String userId,
    String id,
  );
}
