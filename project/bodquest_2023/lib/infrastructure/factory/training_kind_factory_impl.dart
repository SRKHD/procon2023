import '../../domain/factory/training_kind_factory.dart';
import '../../domain/value/training_kind.dart';
import '../model/firestore/rug_training_kind.dart';

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
  TrainingKind createFromModel(RugTrainingKind gender) {
    switch (gender) {
      case RugTrainingKind.run:
        return TrainingKind.run;
      case RugTrainingKind.workOut:
        return TrainingKind.workOut;
      default:
        return TrainingKind.walk;
    }
  }
}
