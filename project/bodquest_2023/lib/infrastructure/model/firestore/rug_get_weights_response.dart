import 'rug_weight.dart';

class RugGetWeightsResponse {
  final List<RugWeight> results;

  RugGetWeightsResponse({
    required this.results,
  });

  factory RugGetWeightsResponse.fromJson(Map<String, dynamic>? json) {
    return RugGetWeightsResponse(
      results: json?['results']
          .map<RugWeight>((e) => RugWeight.fromJson(e))
          .toList(),
    );
  }
}
