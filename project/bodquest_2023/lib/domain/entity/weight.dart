class Weight {
  final String id; // 識別ID
  final String userId; // ユーザーID
  final DateTime date; // 実施日
  final int timestamp; // タイムスタンプ
  final double value; // 値

  const Weight({
    required this.id,
    required this.userId,
    required this.date,
    required this.timestamp,
    required this.value,
  });
}
