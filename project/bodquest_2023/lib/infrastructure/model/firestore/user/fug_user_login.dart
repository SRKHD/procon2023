class FugUserLogin {
  final String uuid;
  final String username;

  FugUserLogin({
    required this.uuid,
    required this.username,
  });

  factory FugUserLogin.fromJson(Map<String, dynamic> json) {
    return FugUserLogin(
      uuid: json['uuid'],
      username: json['username'],
    );
  }
}
