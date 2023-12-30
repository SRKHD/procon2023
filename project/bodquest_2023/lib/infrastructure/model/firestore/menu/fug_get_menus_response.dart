import 'fug_menu.dart';

class FugGetMenusResponse {
  final List<FugMenu> results;

  FugGetMenusResponse({
    required this.results,
  });

  factory FugGetMenusResponse.fromJson(Map<String, dynamic>? json) {
    return FugGetMenusResponse(results: [FugMenu.fromJson(json)]);
  }
}
