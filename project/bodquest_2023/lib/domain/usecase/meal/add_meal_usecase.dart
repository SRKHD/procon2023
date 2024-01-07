abstract interface class IAddMealUsecase {
  Future<int> execute(
    String userId,
    String kind,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  );
}
