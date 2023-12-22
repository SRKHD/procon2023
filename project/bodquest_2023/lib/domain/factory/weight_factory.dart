import '../../infrastructure/model/firestore/rug_weight.dart';
import '../entity/weight.dart';

abstract interface class IWeightFactory {
  /// [Weight]を生成する
  Weight create({
    required String userId,
    required DateTime date,
    required int timestamp,
    required double value,
  });

  /// [RugWeight]から[Weight]を生成する
  Weight createFromModel(RugWeight weight);
}
