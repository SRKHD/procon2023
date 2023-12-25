import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/factory/meal/meal_factory_impl.dart';
import '../infrastructure/factory/training/training_factory_impl.dart';
import '../infrastructure/factory/training/training_kind_factory_impl.dart';
import '../infrastructure/factory/user/user_factory_impl.dart';
import '../infrastructure/factory/user/user_gender_factory_impl.dart';
import '../infrastructure/factory/weight/weight_factory_impl.dart';
import '../domain/factory/meal/meal_factory.dart';
import '../domain/factory/training/training_factory.dart';
import '../domain/factory/training/training_kind_factory.dart';
import '../domain/factory/user/user_factory.dart';
import '../domain/factory/user/user_gender_factory.dart';
import '../domain/factory/weight/weight_factory.dart';

/// User
///
///
final userFactoryProvider = Provider<IUserFactory>(
  (ref) => UserFactoryImpl(
    factory: ref.watch(userGenderFactoryProvider),
  ),
);

final userGenderFactoryProvider = Provider<IUserGenderFactory>(
  (ref) => UserGenderFactoryImpl(),
);

/// Weight
///
///
final weightFactoryProvider = Provider<IWeightFactory>(
  (ref) => WeightFactoryImpl(),
);

/// Training
///
///
final trainingFactoryProvider = Provider<ITrainingFactory>(
  (ref) => TrainingFactoryImpl(
    factory: ref.watch(trainingKindFactoryProvider),
  ),
);

final trainingKindFactoryProvider = Provider<ITrainingKindFactory>(
  (ref) => TrainingKindFactoryImpl(),
);

/// Meal
///
///
final mealFactoryProvider = Provider<IMealFactory>(
  (ref) => MealFactoryImpl(),
);

/// Evaluation
///
///
