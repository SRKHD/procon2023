abstract interface class ISynchronizeHealthiaTrainingsUsecase {
  Future<int> execute(
    String userId,
    DateTime date,
  );
}
