import '../entity/weight.dart';

abstract interface class IWeightRepository {
  /// ユーザー一覧の取得
  Stream<List<Weight>> findAll(String userId);
  Future<int> addWeight(
    String userId,
    DateTime date,
    double value,
  );
}
