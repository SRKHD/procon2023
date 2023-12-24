import '../../../infrastructure/model/firestore/weight/fug_weight.dart';
import '../../entity/weight.dart';

abstract interface class IWeightFactory {
  /// [Weight]を生成する
  Weight create({
    required String userId,
    required DateTime date,
    required int timestamp,
    required double value,
  });

  /// [FugWeight]から[Weight]を生成する
  Weight createFromModel(FugWeight weight);
}
