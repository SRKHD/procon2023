import 'fug_weight.dart';

class FugGetWeightsResponse {
  final List<FugWeight> results;

  FugGetWeightsResponse({
    required this.results,
  });

  factory FugGetWeightsResponse.fromJson(Map<String, dynamic>? json) {
    return FugGetWeightsResponse(results: [FugWeight.fromJson(json)]
        // results: json?['results']
        //     .map<FugWeight>((e) => FugWeight.fromJson(e))
        //     .toList(),
        );
  }
}
