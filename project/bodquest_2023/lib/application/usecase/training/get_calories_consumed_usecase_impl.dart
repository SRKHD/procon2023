import '../../../domain/entity/training.dart';
import '../../../domain/usecase/training/get_calories_consumed_usecase.dart';
import '../../../domain/value/training_kind.dart';

class GetCaloriesConsumedUsecaseImpl implements IGetCaloriesConsumedUsecase {
  @override
  double get(Training target) {
    // TODO: Replace constants.
    const weight = 70;

    final met = _getMet(target.kind);
    final hours = target.value / 60;

    return met * hours * weight * 1.05;
  }

  double _getMet(TrainingKind kind) {
    if (kind case TrainingKind.walk) {
      return 3.5;
    } else if (kind case TrainingKind.run) {
      return 7;
    } else if (kind case TrainingKind.workOut) {
      return 3.8;
    }
    return 0;
  }
}
