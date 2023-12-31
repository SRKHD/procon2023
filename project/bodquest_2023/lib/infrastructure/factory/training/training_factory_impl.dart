import '../../../domain/entity/training.dart';
import '../../../domain/factory/training/training_factory.dart';
import '../../../domain/factory/training/training_kind_factory.dart';
import '../../model/firestore/training/fug_training.dart';

class TrainingFactoryImpl implements ITrainingFactory {
  TrainingFactoryImpl({
    required ITrainingKindFactory factory,
  }) : trainingKindFactory = factory;
  final ITrainingKindFactory trainingKindFactory;

  @override
  Training create({
    required String id,
    required String userId,
    required String kind,
    required DateTime date,
    required int timestamp,
    required int value,
  }) {
    return Training(
      id: id,
      userId: userId,
      kind: trainingKindFactory.create(kind),
      date: date,
      timestamp: timestamp,
      value: value,
    );
  }

  @override
  Training createFromModel(FugTraining training) {
    return Training(
      id: training.id,
      userId: training.userId,
      kind: trainingKindFactory.createFromModel(training.kind),
      date: training.date,
      timestamp: training.timestamp,
      value: training.value,
    );
  }
}
