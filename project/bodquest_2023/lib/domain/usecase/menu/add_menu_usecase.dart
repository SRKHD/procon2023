import 'dart:typed_data';

abstract interface class IAddMenuUsecase {
  Future<int> execute(
    String userId,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    Uint8List? imageData,
  );
}
