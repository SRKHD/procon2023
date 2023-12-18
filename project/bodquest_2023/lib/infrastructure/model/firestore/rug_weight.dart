class RugWeight {
  final String userId;
  final DateTime date;
  final int timestamp;
  final double value;

  RugWeight({
    required this.userId,
    required this.date,
    required this.timestamp,
    required this.value,
  });

  factory RugWeight.fromJson(json) {
    DateTime date = json['date'].toDate();
    return RugWeight(
      userId: json['userId'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      value: json['value'].toDouble(),
    );
  }
}
