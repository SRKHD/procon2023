import '../../domain/entity/training.dart';
import '../../domain/factory/training_factory.dart';
import '../../domain/factory/training_kind_factory.dart';
import '../model/firestore/rug_training.dart';

class TrainingFactoryImpl implements ITrainingFactory {
  TrainingFactoryImpl({
    required ITrainingKindFactory factory,
  }) : trainingKindFactory = factory;
  final ITrainingKindFactory trainingKindFactory;

  @override
  Training create({
    required String userId,
    required String kind,
    required DateTime date,
    required int value,
  }) {
    return Training(
      userId: userId,
      kind: trainingKindFactory.create(kind),
      date: date,
      value: value,
    );
  }

  @override
  Training createFromModel(RugTraining training) {
    return Training(
      userId: training.userId,
      kind: trainingKindFactory.createFromModel(training.kind),
      date: training.date,
      value: training.value,
    );
  }
}
