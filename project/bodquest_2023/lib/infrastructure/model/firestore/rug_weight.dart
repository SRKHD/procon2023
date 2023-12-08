class RugWeight {
  final String userId;
  final double value;

  RugWeight({
    required this.userId,
    required this.value,
  });

  factory RugWeight.fromJson(json) {
    return RugWeight(
      userId: json['userId'],
      value: json['value'].toDouble(),
    );
  }
}
