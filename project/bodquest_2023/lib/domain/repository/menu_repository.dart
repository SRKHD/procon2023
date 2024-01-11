import 'dart:typed_data';

import '../entity/menu.dart';

abstract interface class IMenuRepository {
  Stream<List<Menu>> get(String userId);

  Future<int> add(
    String userId,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    Uint8List? imageData,
  );

  Future<int> delete(
    String userId,
    String id,
  );

  Future<int> update(
    String userId,
    String id,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    Uint8List? imageData,
  );
}
