import '../entity/training.dart';

abstract interface class ITrainingRepository {
  /// ユーザー一覧の取得
  Stream<List<Training>> findAll(String userId);
  Future<int> addTraining(
    String userId,
    String kind,
    DateTime date,
    int value,
  );
}
