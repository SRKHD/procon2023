import '../../../domain/entity/weight.dart';
import '../../../domain/factory/weight/weight_factory.dart';
import '../../model/firestore/weight/rug_weight.dart';

class WeightFactoryImpl implements IWeightFactory {
  @override
  Weight create({
    required String userId,
    required DateTime date,
    required int timestamp,
    required double value,
  }) {
    return Weight(
      userId: userId,
      value: value,
      timestamp: timestamp,
      date: date,
    );
  }

  @override
  Weight createFromModel(RugWeight weight) {
    return Weight(
      userId: weight.userId,
      date: weight.date,
      timestamp: weight.timestamp,
      value: weight.value,
    );
  }
}
