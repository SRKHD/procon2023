import '../entity/menu.dart';

abstract interface class IMenuRepository {
  Stream<List<Menu>> findAll(String userId);
  Future<int> addMenu(
    String userId,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    String imageFilePath,
  );
}
