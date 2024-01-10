import 'dart:math';

import '../../../domain/repository/meal_repository.dart';
import '../../../domain/repository/training_repository.dart';
import '../../../domain/repository/user_repository.dart';
import '../../../domain/repository/weight_repository.dart';
import '../../../domain/usecase/evaluation/calculate_evaluation_usecase.dart';
import '../../../domain/usecase/training/get_calories_consumed_usecase.dart';
import '../../../domain/usecase/user/get_ideal_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../../domain/value/evaluation_rank.dart';
import '../../../presentation/notifier/evaluation/evaluation_notifier.dart';

class CalculateEvaluationUsecaseImpl implements ICalculateEvaluationUsecase {
  double _outgoing = 0;
  double _basalOutgoing = 0;
  double _incoming = 0;
  double _targetActualOutgoing = 0;
  int _weightScore = 0;
  int _exerciseScore = 0;
  int _mealScore = 0;
  double _predictedWeight = 0;

  double _latestWeight = 0;

  int get score {
    final actualOutgoing = _outgoing + _basalOutgoing - _incoming;

    final actualOutgoingPerDay = actualOutgoing / DateTime.now().day;

    // 脂肪1kg当たりのカロリー(7200kcal)から30日後の体重を予測。
    final predictedCalorie = actualOutgoingPerDay * 30;
    _predictedWeight = _latestWeight - predictedCalorie / 7200;

    final rate = _targetActualOutgoing == 0
        ? 1.0
        : actualOutgoing / _targetActualOutgoing;

    return (100 * rate).toInt();
  }

  CalculateEvaluationUsecaseImpl({
    required this.getLogInUserUsecase,
    required this.userRepository,
    required this.trainingRepository,
    required this.weightRepository,
    required this.getIdealUsecase,
    required this.mealRepository,
    required this.getCaloriesConsumedUsecase,
    required this.evaluationNotifier,
  }) {
    calcScore();
  }

  final IGetLogInUserUsecase getLogInUserUsecase;
  final IUserRepository userRepository;
  final ITrainingRepository trainingRepository;
  final IWeightRepository weightRepository;
  final IGetIdealUsecase getIdealUsecase;
  final IMealRepository mealRepository;
  final IGetCaloriesConsumedUsecase getCaloriesConsumedUsecase;
  final EvaluationNotifier evaluationNotifier;

  EvaluationRank getRank(int score) {
    if (score < 0) {
      return EvaluationRank.g;
    } else if (score < 10) {
      return EvaluationRank.f;
    } else if (score < 20) {
      return EvaluationRank.e;
    } else if (score < 30) {
      return EvaluationRank.d;
    } else if (score < 50) {
      return EvaluationRank.c;
    } else if (score < 70) {
      return EvaluationRank.b;
    } else if (score < 100) {
      return EvaluationRank.a;
    } else {
      return EvaluationRank.s;
    }
  }

  DateTime _oneDayThisMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  void updateState(int score) {
    final newValue = evaluationNotifier.value.copyWith(
      score: score.clamp(0, 100),
      weightScore: _weightScore.clamp(0, 100),
      exerciseScore: _exerciseScore.clamp(0, 100),
      mealScore: _mealScore.clamp(0, 100),
      rank: getRank(score).stringValue,
      predictedWeight: _predictedWeight,
    );
    evaluationNotifier.update(newValue);
  }

  Future<void> calcScore() async {
    var user = await getLogInUserUsecase.execute();

    _basalOutgoing =
        (await getIdealUsecase.getBaseEnergyExpenditure(user)).toDouble();

    // 今月一日
    final thresholdDay = _oneDayThisMonth();

    trainingRepository.get(user.id).listen((trainings) {
      _outgoing = trainings
          .where((training) => training.date.isAfter(thresholdDay))
          .map((training) => getCaloriesConsumedUsecase.get(training))
          .reduce((value, element) => value + element);

      // TODO: Replace constant.
      const target = 7200 * 3; // 今月の目標消費カロリー: 3kg * 7200kcal

      _exerciseScore = (_outgoing / target * 100).toInt();

      updateState(score);
    });

    mealRepository.get(user.id).listen((meals) {
      _incoming = meals
          .where((meal) => meal.date.isAfter(thresholdDay))
          .map((meal) => meal.calorie)
          .reduce((value, element) => value + element)
          .toDouble();

      final scoringRange = meals
          .where((meal) => meal.date.isAfter(thresholdDay))
          .map((meal) => meal.calorie);

      final scoreRate =
          scoringRange.where((cal) => cal <= _basalOutgoing).length.toDouble() /
              30;

      _mealScore = (scoreRate * 100).toInt();

      updateState(score);
    });

    weightRepository.get(user.id).listen((weights) {
      weights.sort((a, b) => a.timestamp.compareTo(b.timestamp));

      final baseWeight = weights
          .where((weight) => weight.date.isBefore(thresholdDay))
          .lastOrNull
          ?.value;

      _latestWeight = weights.lastOrNull?.value ?? 0;

      // 目標との差分はすべて脂肪と仮定.
      final fatWeight = baseWeight == null ? 0 : user.targetWeight - baseWeight;

      // TODO: Replace constant.
      const pace = 3; // target pace: 3kg / month

      // Target actual outgoing := fat calory ~ 7200 * fat weight.
      final targetFatWeight = max(fatWeight, pace);
      final targetActualOutgoing = 7200 * targetFatWeight;

      // Decreasing direction only.
      _targetActualOutgoing = max(0, targetActualOutgoing).toDouble();

      // Scoring.
      final latestWeight = weights.lastOrNull?.value;

      _weightScore = latestWeight == null || baseWeight == null
          ? 0
          : ((baseWeight - latestWeight) / targetFatWeight * 100).toInt();

      updateState(score);
    });
  }

  @override
  Future<void> execute() async {}
}
