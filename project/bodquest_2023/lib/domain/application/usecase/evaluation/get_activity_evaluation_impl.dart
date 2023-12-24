import 'package:bodquest_2023/domain/value/evaluation_rank.dart';

import '../../../repository/meal_repository.dart';
import '../../../repository/training_repository.dart';
import '../../../repository/user_repository.dart';
import '../../../repository/weight_repository.dart';
import '../../../usecase/evaluation/get_activity_evaluation_usecase.dart';
import '../../../usecase/training/get_calories_consumed_usecase.dart';
import '../../../usecase/user/get_ideal_usecase.dart';
import '../../../usecase/user/get_login_user_usecase.dart';

class GetActivityEvaluationUsecaseImpl
    implements IGetActivityEvaluationUsecase {
  GetActivityEvaluationUsecaseImpl({
    required this.getLogInUserUsecase,
    required this.userRepository,
    required this.trainingRepository,
    required this.weightRepository,
    required this.getIdealUsecase,
    required this.mealRepository,
    required this.getCaloriesConsumedUsecase,
  });

  final IGetLogInUserUsecase getLogInUserUsecase;
  final IUserRepository userRepository;
  final ITrainingRepository trainingRepository;
  final IWeightRepository weightRepository;
  final IGetIdealUsecase getIdealUsecase;
  final IMealRepository mealRepository;
  final IGetCaloriesConsumedUsecase getCaloriesConsumedUsecase;

  @override
  Future<EvaluationRank> getRank(String userId) {
    // TODO: implement getRank
    EvaluationRank result = EvaluationRank.s;
    getScore(userId).then((score) => {
          if (score < 100)
            result = EvaluationRank.g
          else if (score < 200)
            result = EvaluationRank.f
          else if (score < 300)
            result = EvaluationRank.e
          else if (score < 400)
            result = EvaluationRank.d
          else if (score < 500)
            result = EvaluationRank.c
          else if (score < 600)
            result = EvaluationRank.b
          else if (score < 700)
            result = EvaluationRank.a
        });
    return Future.value(result);
  }

  DateTime oneDayThisMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  @override
  Future<int> getScore(String userId) async {
    // TODO: implement getScore
    var user = await getLogInUserUsecase.execute();
    // var user = await userRepository
    //     .findAll()
    //     .then((users) => users.firstWhere((user) => user.id == userId));
    var thresholdDay = oneDayThisMonth();
    var trainingsStream = trainingRepository.findAll(userId).map((trainings) =>
        trainings.where((training) => training.date.isAfter(thresholdDay)));
    var weightsStream = weightRepository.findAll(userId).map((weights) =>
        weights.where((weight) => weight.date.isAfter(thresholdDay)));
    var mealsStream = mealRepository
        .findAll(userId)
        .map((meals) => meals.where((meal) => meal.date.isAfter(thresholdDay)));

    double result = 0;

    /// カロリー評価
    // 1日に必要なエネルギー
    int estimatedEnergyRequirements =
        await getIdealUsecase.getEstimatedEnergyRequirements(user);
    // 基礎代謝
    int basalMetabolism = await getIdealUsecase.getBasalMetabolism(user);
    // 基準値(この数値をマイナスにした分痩せる？)
    int standardCalorie = estimatedEnergyRequirements - basalMetabolism;
    await for (final trainings in trainingsStream) {
      for (final training in trainings) {
        result += getCaloriesConsumedUsecase.get(training) - standardCalorie;
      }
    }
    await for (final meals in mealsStream) {
      for (final meal in meals) {
        result -= meal.calorie;
      }
    }

    /// 体重評価
    /// 理想体重
    double idealWeight = await getIdealUsecase.getIdealWeight(user);
    await for (final weights in weightsStream) {
      for (final weight in weights) {
        if (weight.value >= idealWeight) {
          result += (weight.value / idealWeight) * 100;
        } else {
          result += (idealWeight - weight.value) * 1000;
        }
      }
    }
    return result.toInt();
  }
}
