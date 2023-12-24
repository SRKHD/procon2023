class FugWeight {
  final String userId;
  final DateTime date;
  final int timestamp;
  final double value;

  FugWeight({
    required this.userId,
    required this.date,
    required this.timestamp,
    required this.value,
  });

  factory FugWeight.fromJson(json) {
    DateTime date = json['date'].toDate();
    return FugWeight(
      userId: json['userId'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      value: json['value'].toDouble(),
    );
  }
}
