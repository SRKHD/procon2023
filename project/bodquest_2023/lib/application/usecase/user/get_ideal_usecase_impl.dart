import '../../../domain/entity/user.dart';
import '../../../domain/usecase/user/get_ideal_usecase.dart';
import '../../../domain/value/user_gender.dart';

class GetIdealUsecaseImpl implements IGetIdealUsecase {
  @override
  Future<int> getEstimatedEnergyRequirements(User target) {
    // 一日の総消費カロリー(Total Daily Energy Expenditure: TDEE)
    return getBasalMetabolism(target).then(
        (basalMetabolism) => (1.2 * basalMetabolism).toInt()); // ほぼ運動しないと仮定。
  }

  @override
  Future<double> getIdealWeight(User target) {
    // TODO: 未完成(実装者募集中) getIdealWeight
    return Future.value(65);
  }

  @override
  Future<int> getBasalMetabolism(User target) {
    // TODO: Replace constants.
    const weight = 70;
    const age = 30;

    return Future.value((target.gender == UserGender.male
            ? 13.397 * weight + 4.799 * target.height - 5.677 * age + 88.362
            : 9.247 * weight + 3.098 * target.height - 4.33 * age + 447.593)
        .toInt());
  }
}
