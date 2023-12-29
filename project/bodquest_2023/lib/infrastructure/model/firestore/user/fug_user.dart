import 'fug_user_dob.dart';
import 'fug_user_gender.dart';
import 'fug_user_login.dart';
import 'fug_user_name.dart';
import 'fug_user_picture.dart';

class FugUser {
  final FugUserGender gender;
  final FugUserName name;
  final FugUserLogin login;
  final FugUserPicture picture;
  final FugUserDob dob;
  final double targetWeight;
  final double height;

  FugUser({
    required this.gender,
    required this.name,
    required this.login,
    required this.picture,
    required this.dob,
    required this.targetWeight,
    required this.height,
  });

  factory FugUser.fromJson(json) {
    return FugUser(
      gender: FugUserGender.from(json['gender']),
      name: FugUserName.fromJson(json['name']),
      login: FugUserLogin.fromJson(json['login']),
      picture: FugUserPicture.fromJson(json['picture']),
      dob: FugUserDob.fromJson(json['dob']),
      targetWeight: json['targetWeight'].toDouble(),
      height: json['height'].toDouble(),
    );
  }
}
