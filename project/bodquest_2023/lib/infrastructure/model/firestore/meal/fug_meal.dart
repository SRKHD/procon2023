import 'fug_meal_kind.dart';

class FugMeal {
  final String id;
  final String userId;
  final FugMealKind kind;
  final String name;
  final DateTime date;
  final int timestamp;
  final int calorie;
  final String imageFilePath;

  FugMeal({
    required this.id,
    required this.userId,
    required this.kind,
    required this.name,
    required this.date,
    required this.timestamp,
    required this.calorie,
    required this.imageFilePath,
  });

  factory FugMeal.fromJson(String docId, json) {
    DateTime date = json['date'].toDate();
    return FugMeal(
      id: docId,
      userId: json['userId'],
      kind: FugMealKind.from(json['kind']),
      name: json['name'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      calorie: json['calorie'].toInt(),
      imageFilePath: json['imageFilePath'],
    );
  }
}
