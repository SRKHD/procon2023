import 'package:bodquest_2023/domain/factory/training_kind_factory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/factory/training_factory_impl.dart';
import '../../infrastructure/model/firestore/rug_training.dart';
import '../entity/training.dart';

final trainingFactoryProvider = Provider<ITrainingFactory>(
  (ref) => TrainingFactoryImpl(
    factory: ref.watch(trainingKindFactoryProvider),
  ),
);

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
