import '../../domain/entity/weight.dart';
import '../../domain/factory/weight_factory.dart';
import '../model/firestore/rug_weight.dart';

class WeightFactoryImpl implements IWeightFactory {
  @override
  Weight create({
    required String userId,
    required double value,
  }) {
    return Weight(
      userId: userId,
      value: value,
    );
  }

  @override
  Weight createFromModel(RugWeight weight) {
    return Weight(
      userId: weight.userId,
      value: weight.value,
    );
  }
}
