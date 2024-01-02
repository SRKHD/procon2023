class FugWeight {
  final String id;
  final String userId;
  final DateTime date;
  final int timestamp;
  final double value;

  FugWeight({
    required this.id,
    required this.userId,
    required this.date,
    required this.timestamp,
    required this.value,
  });

  factory FugWeight.fromJson(String docId, json) {
    DateTime date = json['date'].toDate();
    return FugWeight(
      id: docId,
      userId: json['userId'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      value: json['value'].toDouble(),
    );
  }
}
