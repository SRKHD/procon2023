import '../value/training_kind.dart';

class Training {
  final String id; // 識別ID
  final String userId; // ユーザーID
  final TrainingKind kind; // トレーニング種類
  final DateTime date; // 実施日
  final int timestamp; // タイムスタンプ
  final int value; // 値

  Training({
    required this.id,
    required this.userId,
    required this.kind,
    required this.date,
    required this.timestamp,
    required this.value,
  });
}
