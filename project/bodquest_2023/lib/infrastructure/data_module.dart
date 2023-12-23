import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain_module.dart';
import '../domain/repository/meal_repository.dart';
import '../domain/repository/training_repository.dart';
import '../domain/repository/user_repository.dart';
import '../domain/repository/weight_repository.dart';
import 'datasource/firebase_auth/user_datasource.dart';
import 'datasource/firebase_auth/user_datasource_impl.dart';
import 'datasource/firestore/meals_datasource.dart';
import 'datasource/firestore/meals_datasource_impl.dart';
import 'datasource/firestore/trainings_datasource_impl.dart';
import 'datasource/firestore/users_datasource.dart';
import 'datasource/firestore/trainings_datasource.dart';
import 'datasource/firestore/users_datasource_impl.dart';
import 'datasource/firestore/weights_datasource.dart';
import 'datasource/firestore/weights_datasource_impl.dart';
import 'repository/meal_repository_impl.dart';
import 'repository/training_repository_impl.dart';
import 'repository/user_repository_impl.dart';
import 'repository/weight_repository_impl.dart';

/// User
///
///
final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRepositoryImpl(
      fireStoreDataSource: ref.watch(fireStoreUsersDataSourceProvider),
      firebaseDataSource: ref.watch(firebaseAuthUserDataSourceProvider),
      factory: ref.watch(userFactoryProvider));
});

final firebaseAuthUserDataSourceProvider =
    Provider<IFirebaseAuthUserDataSource>(
  (ref) => FirebaseAuthUserDataSourceImpl(),
);

final fireStoreUsersDataSourceProvider = Provider<IFirestoreUsersDataSource>(
  (ref) => FirestoreUsersDataSourceImpl(),
);

/// Weight
///
///
final weightRepositoryProvider = Provider<IWeightRepository>(
  (ref) => WeightRepositoryImpl(
    dataSource: ref.watch(fireStoreWeightsDataSourceProvider),
    factory: ref.watch(weightFactoryProvider),
  ),
);

final fireStoreWeightsDataSourceProvider =
    Provider<IFirestoreWeightsDataSource>(
  (ref) => FirestoreWeightsDataSourceImpl(),
);

/// Training
///
///
final trainingRepositoryProvider = Provider<ITrainingRepository>(
  (ref) => TrainingRepositoryImpl(
    dataSource: ref.watch(fireStoreTrainingsDataSourceProvider),
    factory: ref.watch(trainingFactoryProvider),
  ),
);

final fireStoreTrainingsDataSourceProvider =
    Provider<IFirestoreTrainingsDataSource>(
  (ref) => FirestoreTrainingsDataSourceImpl(),
);

/// Meal
///
///
final mealRepositoryProvider = Provider<IMealRepository>(
  (ref) => MealRepositoryImpl(
    dataSource: ref.watch(fireStoreMealsDataSourceProvider),
    factory: ref.watch(mealFactoryProvider),
  ),
);

final fireStoreMealsDataSourceProvider = Provider<IFirestoreMealsDataSource>(
  (ref) => FirestoreMealsDataSourceImpl(),
);
