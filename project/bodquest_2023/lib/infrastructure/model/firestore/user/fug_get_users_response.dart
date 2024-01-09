import 'fug_user.dart';

class FugGetUsersResponse {
  final List<FugUser> results;

  FugGetUsersResponse({
    required this.results,
  });

  factory FugGetUsersResponse.fromJson(Map<String, dynamic>? json) {
    return FugGetUsersResponse(results: [FugUser.fromJson(json)]);
  }
}
