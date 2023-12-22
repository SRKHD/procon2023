import 'rug_user.dart';

class RugGetUsersResponse {
  final List<RugUser> results;

  RugGetUsersResponse({
    required this.results,
  });

  factory RugGetUsersResponse.fromJson(Map<String, dynamic>? json) {
    return RugGetUsersResponse(
      results:
          json?['results'].map<RugUser>((e) => RugUser.fromJson(e)).toList(),
    );
  }
}
