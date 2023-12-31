import '../../../domain/entity/user.dart';
import '../../../domain/usecase/user/get_ideal_usecase.dart';

class GetIdealUsecaseImpl implements IGetIdealUsecase {
  @override
  Future<int> getEstimatedEnergyRequirements(User target) {
    // TODO: 未完成(実装者募集中) getEstimatedEnergyRequirements
    return Future.value(1800);
  }

  @override
  Future<double> getIdealWeight(User target) {
    // TODO: 未完成(実装者募集中) getIdealWeight
    return Future.value(65);
  }

  @override
  Future<int> getBasalMetabolism(User target) {
    // TODO: 未完成(実装者募集中) getBasalMetabolism
    return Future.value(1600);
  }
}
