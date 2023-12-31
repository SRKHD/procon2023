import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/repository/menu_repository.dart';
import '../infrastructure/repository/menu_repository_impl.dart';
import 'datasource_module.dart';
import 'factory_provider_module.dart';
import '../domain/repository/meal_repository.dart';
import '../domain/repository/training_repository.dart';
import '../domain/repository/user_repository.dart';
import '../domain/repository/weight_repository.dart';
import '../infrastructure/repository/meal_repository_impl.dart';
import '../infrastructure/repository/training_repository_impl.dart';
import '../infrastructure/repository/user_repository_impl.dart';
import '../infrastructure/repository/weight_repository_impl.dart';

/// User
///
///
final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRepositoryImpl(
      fireStoreDataSource: ref.watch(fireStoreUsersDataSourceProvider),
      firebaseDataSource: ref.watch(firebaseAuthUserDataSourceProvider),
      factory: ref.watch(userFactoryProvider));
});

/// Weight
///
///
final weightRepositoryProvider = Provider<IWeightRepository>(
  (ref) => WeightRepositoryImpl(
    factory: ref.watch(weightFactoryProvider),
    dataSource: ref.watch(fireStoreWeightsDataSourceProvider),
    iOSDatasource: ref.watch(iOSHealthiaWeightsDataSourceProvider),
  ),
);

/// Training
///
///
final trainingRepositoryProvider = Provider<ITrainingRepository>(
  (ref) => TrainingRepositoryImpl(
    dataSource: ref.watch(fireStoreTrainingsDataSourceProvider),
    factory: ref.watch(trainingFactoryProvider),
    iOSDatasource: ref.watch(iOSHealthiaTrainingsDataSourceProvider),
  ),
);

/// Meal
///
///
final mealRepositoryProvider = Provider<IMealRepository>(
  (ref) => MealRepositoryImpl(
    dataSource: ref.watch(fireStoreMealsDataSourceProvider),
    dataStorage: ref.watch(firebaseStorageDataSourceProvider),
    factory: ref.watch(mealFactoryProvider),
  ),
);

/// Menu
///
///
final menuRepositoryProvider = Provider<IMenuRepository>(
  (ref) => MenuRepositoryImpl(
    dataSource: ref.watch(fireStoreMenusDataSourceProvider),
    dataStorage: ref.watch(firebaseStorageDataSourceProvider),
    factory: ref.watch(menuFactoryProvider),
  ),
);
