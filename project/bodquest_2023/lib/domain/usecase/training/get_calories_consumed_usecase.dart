import '../../entity/training.dart';

abstract interface class IGetCaloriesConsumedUsecase {
  /// [target]に対応するMetabolic Equivalent of Task(MET)を返します.
  double get(Training target);
}
