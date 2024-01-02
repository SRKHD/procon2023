import '../../../infrastructure/model/firestore/training/fug_training.dart';
import '../../entity/training.dart';

abstract interface class ITrainingFactory {
  /// [Training]を生成する
  Training create({
    required String id,
    required String userId,
    required String kind,
    required DateTime date,
    required int timestamp,
    required int value,
  });

  /// [FugTraining]から[Training]を生成する
  Training createFromModel(FugTraining target);
}
