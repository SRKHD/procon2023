class Weight {
  final String userId; // 識別ID
  final double value; // 値
  final DateTime? timestamp;

  const Weight({
    required this.userId,
    required this.value,
    this.timestamp,
  });
}
