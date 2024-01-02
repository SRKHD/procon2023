import 'fug_training_kind.dart';

class FugTraining {
  final String id;
  final String userId;
  final FugTrainingKind kind;
  final DateTime date;
  final int timestamp;
  final int value;

  FugTraining({
    required this.id,
    required this.userId,
    required this.kind,
    required this.date,
    required this.timestamp,
    required this.value,
  });

  factory FugTraining.fromJson(String docId, json) {
    DateTime date = json['date'].toDate();
    return FugTraining(
      id: docId,
      userId: json['userId'],
      kind: FugTrainingKind.from(json['kind']),
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      value: json['value'].toInt(),
    );
  }
}
