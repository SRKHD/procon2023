class FugMeal {
  final String id;
  final String userId;
  final String name;
  final DateTime date;
  final int timestamp;
  final int calorie;
  final String imageFilePath;

  FugMeal({
    required this.id,
    required this.userId,
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
      name: json['name'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      calorie: json['calorie'].toInt(),
      imageFilePath: json['imageFilePath'],
    );
  }
}
