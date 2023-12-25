import '../../entity/evaluation.dart';

abstract interface class IEvaluationFactory {
  /// [Evaluation]を生成する
  Evaluation create({
    required String userId,
    required DateTime date,
    required int timestamp,
    required double value,
  });
}
