import 'fug_training.dart';

class FugGetTrainingsResponse {
  final List<FugTraining> results;

  FugGetTrainingsResponse({
    required this.results,
  });

  factory FugGetTrainingsResponse.fromJson(Map<String, dynamic>? json) {
    return FugGetTrainingsResponse(results: [FugTraining.fromJson(json)]);
  }
}
