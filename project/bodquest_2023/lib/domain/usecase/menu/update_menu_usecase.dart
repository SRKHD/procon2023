abstract interface class IUpdateMenuUsecase {
  Future<int> execute(
    String userId,
    String id,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    String imageFilePath,
  );
}
