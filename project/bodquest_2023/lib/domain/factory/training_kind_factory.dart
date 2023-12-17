import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/factory/training_kind_factory_impl.dart';
import '../../infrastructure/model/firestore/rug_training_kind.dart';
import '../value/training_kind.dart';

final trainingKindFactoryProvider = Provider<ITrainingKindFactory>(
  (ref) => TrainingKindFactoryImpl(),
);

abstract interface class ITrainingKindFactory {
  /// [TrainingKind]を生成する
  TrainingKind create(String value);

  /// [RugUserGender]から[UserGender]を生成する
  TrainingKind createFromModel(RugTrainingKind kind);
}
