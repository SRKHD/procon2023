import '../../infrastructure/model/firestore/rug_training.dart';
import '../entity/training.dart';

abstract interface class ITrainingFactory {
  /// [Training]を生成する
  Training create({
    required String userId,
    required String kind,
    required DateTime date,
    required int value,
  });

  /// [RugTraining]から[Training]を生成する
  Training createFromModel(RugTraining target);
}
