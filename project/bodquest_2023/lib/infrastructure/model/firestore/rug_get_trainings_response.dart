import 'rug_training.dart';

class RugGetTrainingsResponse {
  final List<RugTraining> results;

  RugGetTrainingsResponse({
    required this.results,
  });

  factory RugGetTrainingsResponse.fromJson(Map<String, dynamic>? json) {
    return RugGetTrainingsResponse(results: [RugTraining.fromJson(json)]);
  }
}
