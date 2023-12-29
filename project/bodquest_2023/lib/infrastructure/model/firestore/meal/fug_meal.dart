class FugMeal {
  final String userId;
  final String name;
  final DateTime date;
  final int timestamp;
  final int calorie;
  final String imageFilePath;

  FugMeal({
    required this.userId,
    required this.name,
    required this.date,
    required this.timestamp,
    required this.calorie,
    required this.imageFilePath,
  });

  factory FugMeal.fromJson(json) {
    DateTime date = json['date'].toDate();
    return FugMeal(
      userId: json['userId'],
      name: json['name'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      calorie: json['calorie'].toInt(),
      imageFilePath: json['imageFilePath'],
    );
  }
}
