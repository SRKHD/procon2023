import 'package:bodquest_2023/domain/entity/user.dart';

import '../../../domain/usecase/user/get_ideal_usecase.dart';

class GetIdealUsecaseImpl implements IGetIdealUsecase {
  @override
  Future<int> getEstimatedEnergyRequirements(User target) {
    // TODO: implement getEstimatedEnergyRequirements
    return Future.value(1800);
  }

  @override
  Future<double> getIdealWeight(User target) {
    // TODO: implement getIdealWeight
    return Future.value(65);
  }

  @override
  Future<int> getBasalMetabolism(User target) {
    // TODO: implement getBasalMetabolism
    return Future.value(1600);
  }
}
