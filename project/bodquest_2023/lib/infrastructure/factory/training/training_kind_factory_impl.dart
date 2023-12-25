import '../../../domain/factory/training/training_kind_factory.dart';
import '../../../domain/value/training_kind.dart';
import '../../model/firestore/training/fug_training_kind.dart';

class TrainingKindFactoryImpl implements ITrainingKindFactory {
  @override
  TrainingKind create(String value) {
    switch (value) {
      case 'walk':
        return TrainingKind.walk;
      case 'run':
        return TrainingKind.run;
      case 'workOut':
        return TrainingKind.workOut;
      default:
        throw ArgumentError();
    }
  }

  @override
  TrainingKind createFromModel(FugTrainingKind gender) {
    switch (gender) {
      case FugTrainingKind.run:
        return TrainingKind.run;
      case FugTrainingKind.workOut:
        return TrainingKind.workOut;
      default:
        return TrainingKind.walk;
    }
  }
}
