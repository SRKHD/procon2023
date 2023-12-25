import 'fug_training_kind.dart';

class FugTraining {
  final String userId;
  final FugTrainingKind kind;
  final DateTime date;
  final int value;

  FugTraining({
    required this.userId,
    required this.kind,
    required this.date,
    required this.value,
  });

  factory FugTraining.fromJson(json) {
    return FugTraining(
      userId: json['userId'],
      kind: FugTrainingKind.from(json['kind']),
      date: json['date'].toDate(),
      value: json['value'].toInt(),
    );
  }
}
