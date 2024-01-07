import 'fug_user_gender.dart';
import 'fug_user_login.dart';
import 'fug_user_name.dart';

class FugUser {
  final FugUserGender gender;
  final FugUserName name;
  final FugUserLogin login;
  final DateTime birthday;
  final double height;

  FugUser({
    required this.gender,
    required this.name,
    required this.login,
    required this.birthday,
    required this.height,
  });

  factory FugUser.fromJson(json) {
    var name = FugUserName.fromJson(json['userName']);
    // DateTimeでnullを受け付けないため、未設定の場合は1500年としている
    var birthday =
        json['birthday'] != null ? json['birthday'].toDate() : DateTime(1500);
    return FugUser(
      gender: FugUserGender.from(json['gender']),
      name: name,
      login: FugUserLogin.fromJson(json['userId'], name.userName),
      birthday: birthday,
      height: json['height'].toDouble(),
    );
  }
}
