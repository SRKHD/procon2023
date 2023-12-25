import '../../value/evaluation_rank.dart';

abstract interface class IGetActivityEvaluationUsecase {
  Future<int> getScore();
  Future<EvaluationRank> getRank();
}
