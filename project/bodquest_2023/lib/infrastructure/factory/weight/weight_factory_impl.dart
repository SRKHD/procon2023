import '../../../domain/entity/weight.dart';
import '../../../domain/factory/weight/weight_factory.dart';
import '../../model/firestore/weight/fug_weight.dart';

class WeightFactoryImpl implements IWeightFactory {
  @override
  Weight create({
    required String id,
    required String userId,
    required DateTime date,
    required int timestamp,
    required double value,
  }) {
    return Weight(
      id: id,
      userId: userId,
      value: value,
      timestamp: timestamp,
      date: date,
    );
  }

  @override
  Weight createFromModel(FugWeight weight) {
    return Weight(
      id: weight.id,
      userId: weight.userId,
      date: weight.date,
      timestamp: weight.timestamp,
      value: weight.value,
    );
  }
}
