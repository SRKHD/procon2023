class RugMeal {
  final String userId;
  final String name;
  final DateTime date;
  final int timestamp;
  final int calorie;

  RugMeal({
    required this.userId,
    required this.name,
    required this.date,
    required this.timestamp,
    required this.calorie,
  });

  factory RugMeal.fromJson(json) {
    DateTime date = json['date'].toDate();
    return RugMeal(
      userId: json['userId'],
      name: json['name'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      calorie: json['calorie'].toInt(),
    );
  }
}
