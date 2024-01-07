abstract interface class IUpdateMealUsecase {
  Future<int> execute(
    String userId,
    String id,
    String kind,
    String name,
    DateTime date,
    int calorie,
    String imageFilePath,
  );
}
