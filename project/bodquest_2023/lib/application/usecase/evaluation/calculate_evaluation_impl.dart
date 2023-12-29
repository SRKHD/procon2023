import 'package:bodquest_2023/domain/value/evaluation_rank.dart';

import '../../../domain/repository/meal_repository.dart';
import '../../../domain/repository/training_repository.dart';
import '../../../domain/repository/user_repository.dart';
import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/evaluation/calculate_evaluation_usecase.dart';
import '../../../domain/usecase/training/get_calories_consumed_usecase.dart';
import '../../../domain/usecase/user/get_ideal_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../../presentation/notifier/evaluation/evaluation_notifier.dart';

class CalculateEvaluationUsecaseImpl implements ICalculateEvaluationUsecase {
  CalculateEvaluationUsecaseImpl({
    required this.getLogInUserUsecase,
    required this.userRepository,
    required this.trainingRepository,
    required this.weightRepository,
    required this.getIdealUsecase,
    required this.mealRepository,
    required this.getCaloriesConsumedUsecase,
    required this.evaluationNotifier,
  });

  final IGetLogInUserUsecase getLogInUserUsecase;
  final IUserRepository userRepository;
  final ITrainingRepository trainingRepository;
  final IWeightRepository weightRepository;
  final IGetIdealUsecase getIdealUsecase;
  final IMealRepository mealRepository;
  final IGetCaloriesConsumedUsecase getCaloriesConsumedUsecase;
  final EvaluationNotifier evaluationNotifier;

  EvaluationRank getRank(int score) {
    // TODO: implement getRank
    if (score < 100) {
      return EvaluationRank.g;
    } else if (score < 200) {
      return EvaluationRank.f;
    } else if (score < 300) {
      return EvaluationRank.e;
    } else if (score < 400) {
      return EvaluationRank.d;
    } else if (score < 500) {
      return EvaluationRank.c;
    } else if (score < 600) {
      return EvaluationRank.b;
    } else if (score < 700) {
      return EvaluationRank.a;
    } else {
      return EvaluationRank.s;
    }
  }

  DateTime oneDayThisMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  void UpdateState(int score) {
    final newValue = evaluationNotifier.value
        .copyWith(score: score, rank: getRank(score).value);
    evaluationNotifier.update(newValue);
  }

  Future<void> calcScore() async {
    // TODO: implement getScore
    var user = await getLogInUserUsecase.execute();

    /// カロリー評価
    // 1日に必要なエネルギー
    int estimatedEnergyRequirements =
        await getIdealUsecase.getEstimatedEnergyRequirements(user);
    // 基礎代謝
    int basalMetabolism = await getIdealUsecase.getBasalMetabolism(user);
    // 基準値(この数値をマイナスにした分痩せる？)
    int standardCalorie = estimatedEnergyRequirements - basalMetabolism;

    // 今月一日
    final thresholdDay = oneDayThisMonth();
    // 理想体重
    double idealWeight = await getIdealUsecase.getIdealWeight(user);

    final trainingsStream = trainingRepository.findAll(user.id);
    final mealsStream = mealRepository.findAll(user.id);
    final weightsStream = weightRepository.findAll(user.id);

    double calculatedScore = 0;
    trainingsStream.listen((x) {
      for (final training in x) {
        if (training.date.isAfter(thresholdDay)) {
          calculatedScore +=
              getCaloriesConsumedUsecase.get(training) - standardCalorie;
        }
      }
      UpdateState(calculatedScore.toInt());
    });

    mealsStream.listen((y) {
      for (final meal in y) {
        if (meal.date.isAfter(thresholdDay)) {
          calculatedScore -= meal.calorie;
        }
      }
      UpdateState(calculatedScore.toInt());
    });

    weightsStream.listen((z) {
      for (final weight in z) {
        //
        if (weight.value >= idealWeight) {
          calculatedScore += (weight.value / idealWeight) * 10;
        } else {
          calculatedScore += (idealWeight - weight.value) * 10;
        }
      }
      UpdateState(calculatedScore.toInt());
    });
  }

  @override
  Future<void> execute() async {
    await calcScore();
  }
}
