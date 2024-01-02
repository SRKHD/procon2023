import '../../entity/user.dart';

abstract interface class IGetIdealUsecase {
  Future<double> getIdealWeight(User target); // 理想体重

  /// 非意識的活動による推定エネルギー必要量.
  /// (基礎代謝 + 仕事、消化などによるエネルギー消費)
  Future<int> getBaseEnergyExpenditure(User target);

  Future<int> getBasalMetabolism(User target); // 基礎代謝
}
