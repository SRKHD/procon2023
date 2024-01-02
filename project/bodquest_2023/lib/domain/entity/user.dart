import '../value/user_gender.dart';

/// ユーザー
class User {
  final String id; // ユーザーID
  final String name; // 名前
  final UserGender gender; // 性別
  final String thumbnail; // サムネイルリンク
  final DateTime birthday; // 生年月日
  final double targetWeight; // 目標体重
  final double height; // 身長

  User({
    required this.id,
    required this.name,
    required this.gender,
    required this.thumbnail,
    required this.birthday,
    required this.targetWeight,
    required this.height,
  });

  /// [User]が誕生日であるか判定する
  bool isBirthday() {
    final today = DateTime.now();
    return birthday.month == today.month && birthday.day == today.day;
  }
}
