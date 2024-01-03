import 'fug_menu.dart';

class FugGetMenusResponse {
  final List<FugMenu> results;

  FugGetMenusResponse({
    required this.results,
  });

  factory FugGetMenusResponse.fromJson(
      String docId, Map<String, dynamic>? json) {
    return FugGetMenusResponse(results: [FugMenu.fromJson(docId, json)]);
  }
}
