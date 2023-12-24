import '../value/user_gender.dart';

/// ユーザー
class User {
  final String id; // 識別ID
  final String name; // 名前
  final UserGender gender; // 性別
  final String thumbnail; // サムネイルリンク
  final DateTime birthday; // 生年月日
  final double targetWeight; // 目標体重

  User({
    required this.id,
    required this.name,
    required this.gender,
    required this.thumbnail,
    required this.birthday,
    required this.targetWeight,
  });

  /// [User]が誕生日であるか判定する
  bool isBirthday() {
    final today = DateTime.now();
    return birthday.month == today.month && birthday.day == today.day;
  }
}
