import '../../value/evaluation_rank.dart';

abstract interface class IActivityEvaluationUsecase {
  Future<int> getScore(String userId);
  Future<EvaluationRank> getRank(String userId);
}
