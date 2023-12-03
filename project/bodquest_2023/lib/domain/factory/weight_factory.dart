import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/factory/weight_factory_impl.dart';
import '../../infrastructure/model/firestore/rug_weight.dart';
import '../entity/weight.dart';

final weightFactoryProvider = Provider<IWeightFactory>(
  (ref) => WeightFactoryImpl(),
);

abstract interface class IWeightFactory {
  /// [Weight]を生成する
  Weight create({
    required String userId,
    required double value,
  });

  /// [RugWeight]から[Weight]を生成する
  Weight createFromModel(RugWeight weight);
}
