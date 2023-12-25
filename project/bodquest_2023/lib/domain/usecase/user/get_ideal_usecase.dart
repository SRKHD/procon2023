import '../../entity/user.dart';

abstract interface class IGetIdealUsecase {
  Future<double> getIdealWeight(User target); // 理想体重
  Future<int> getEstimatedEnergyRequirements(
      User target); // 推定エネルギー必要量(1日に必要なエネルギー)
  Future<int> getBasalMetabolism(User target); // 基礎代謝
}
