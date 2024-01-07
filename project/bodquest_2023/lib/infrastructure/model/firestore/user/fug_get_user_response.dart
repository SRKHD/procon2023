import 'fug_user.dart';

class FugGetUserResponse {
  final FugUser result;

  FugGetUserResponse({
    required this.result,
  });

  factory FugGetUserResponse.fromJson(Map<String, dynamic>? json) {
    return FugGetUserResponse(result: FugUser.fromJson(json));
  }
}
