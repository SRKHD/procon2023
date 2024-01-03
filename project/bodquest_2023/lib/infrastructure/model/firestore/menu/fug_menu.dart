class FugMenu {
  FugMenu({
    required this.id,
    required this.userId,
    required this.name,
    required this.date,
    required this.timestamp,
    required this.recipe,
    required this.ingredient,
    required this.calorie,
    required this.imageFilePath,
  });

  final String id;
  final String userId;
  final String name;
  final DateTime date;
  final int timestamp;
  final String recipe;
  final String ingredient;
  final int calorie;
  final String imageFilePath;

  factory FugMenu.fromJson(String docId, json) {
    DateTime date = json['date'].toDate();
    return FugMenu(
      id: docId,
      userId: json['userId'],
      name: json['name'],
      date: date,
      timestamp: date.millisecondsSinceEpoch,
      recipe: json['recipe'],
      ingredient: json['ingredient'],
      calorie: json['calorie'].toInt(),
      imageFilePath: json['imageFilePath'],
    );
  }
}
