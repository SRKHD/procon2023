import 'rug_training_kind.dart';

class RugTraining {
  final String userId;
  final RugTrainingKind kind;
  final DateTime date;
  final int value;

  RugTraining({
    required this.userId,
    required this.kind,
    required this.date,
    required this.value,
  });

  factory RugTraining.fromJson(json) {
    return RugTraining(
      userId: json['userId'],
      kind: RugTrainingKind.from(json['kind']),
      date: json['date'].toDate(),
      value: json['value'].toInt(),
    );
  }
}
