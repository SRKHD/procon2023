class Meal {
  Meal({
    required this.id,
    required this.userId,
    required this.name,
    required this.date,
    required this.timestamp,
    required this.calorie,
    required this.imageFilePath,
  });
  final String id; // 識別ID
  final String userId; // ユーザーID
  final String name; //名前
  final DateTime date; // 実施日
  final int timestamp; // タイムスタンプ
  final int calorie; // カロリー
  final String imageFilePath; //イメージのパス
}
