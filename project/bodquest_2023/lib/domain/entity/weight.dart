class Weight {
  final String userId; // 識別ID
  final DateTime date; // 実施日
  final int timestamp; // タイムスタンプ
  final double value; // 値

  const Weight({
    required this.userId,
    required this.date,
    required this.timestamp,
    required this.value,
  });
}
