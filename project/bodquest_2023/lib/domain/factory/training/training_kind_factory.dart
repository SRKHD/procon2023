import '../../../infrastructure/model/firestore/training/fug_training_kind.dart';
import '../../value/training_kind.dart';

abstract interface class ITrainingKindFactory {
  /// [TrainingKind]を生成する
  TrainingKind create(String value);

  /// [FugUserGender]から[UserGender]を生成する
  TrainingKind createFromModel(FugTrainingKind kind);
}
