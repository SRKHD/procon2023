class Menu {
  Menu({
    required this.userId,
    required this.name,
    required this.date,
    required this.timestamp,
    required this.recipe,
    required this.ingredient,
    required this.calorie,
    required this.imageFilePath,
  });
  final String userId; // 識別ID
  final String name; //名前
  final DateTime date; // 実施日
  final int timestamp; // タイムスタンプ
  final String recipe; // レシピ
  final String ingredient; // 材料
  final int calorie; // カロリー
  final String imageFilePath; //イメージのパス
}
