abstract interface class IAddMealUsecase {
  Future<int> execute(
    String userId,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  );
}
