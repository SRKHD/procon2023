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
  double _incoming = 0;
  double _targetActualOutgoing = 0;

  int get score {
    final actualOutgoing = _outgoing - _incoming;

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
    final newValue = evaluationNotifier.value
        .copyWith(score: score, rank: getRank(score).value);
    evaluationNotifier.update(newValue);
  }

  Future<void> calcScore() async {
    var user = await getLogInUserUsecase.execute();

    // 今月一日
    final thresholdDay = _oneDayThisMonth();

    trainingRepository.findAll(user.id).listen((trainings) {
      _outgoing = trainings
          .where((training) => training.date.isAfter(thresholdDay))
          .map((training) => getCaloriesConsumedUsecase.get(training))
          .reduce((value, element) => value + element);

      updateState(score);
    });

    mealRepository.findAll(user.id).listen((meals) {
      _incoming = meals
          .where((meal) => meal.date.isAfter(thresholdDay))
          .map((meal) => meal.calorie)
          .reduce((value, element) => value + element)
          .toDouble();

      updateState(score);
    });

    weightRepository.findAll(user.id).listen((weights) {
      final latestWeight = weights
          .where((weight) => weight.date.isBefore(thresholdDay))
          .lastOrNull
          ?.value;

      // 目標との差分はすべて脂肪と仮定.
      final fatWeight =
          latestWeight == null ? 0 : user.targetWeight - latestWeight;

      // TODO: Replace constant.
      const pace = 3; // target pace: 3kg / month

      // Target actual outgoing := fat calory ~ 7200 * fat weight.
      final targetActualOutgoing = 7200 * max(fatWeight, pace);

      // Decreasing direction only.
      _targetActualOutgoing = max(0, targetActualOutgoing).toDouble();

      updateState(score);
    });
  }

  @override
  Future<void> execute() async {}
}
