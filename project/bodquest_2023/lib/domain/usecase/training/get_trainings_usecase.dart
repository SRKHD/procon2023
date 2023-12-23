import '../../entity/training.dart';

abstract interface class IGetTrainingsUsecase {
  Stream<List<Training>> execute(String userId);
}
