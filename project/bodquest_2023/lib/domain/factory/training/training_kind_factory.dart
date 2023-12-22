import '../../../infrastructure/model/firestore/training/rug_training_kind.dart';
import '../../value/training_kind.dart';

abstract interface class ITrainingKindFactory {
  /// [TrainingKind]を生成する
  TrainingKind create(String value);

  /// [RugUserGender]から[UserGender]を生成する
  TrainingKind createFromModel(RugTrainingKind kind);
}
