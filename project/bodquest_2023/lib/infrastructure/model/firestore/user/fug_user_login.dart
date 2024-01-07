class FugUserLogin {
  final String uuid;
  final String username;

  FugUserLogin({
    required this.uuid,
    required this.username,
  });

  factory FugUserLogin.fromJson(String jsonUserId, String name) {
    return FugUserLogin(
      uuid: jsonUserId,
      username: name,
    );
  }
}
