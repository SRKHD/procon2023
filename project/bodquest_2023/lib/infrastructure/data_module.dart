import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain_module.dart';
import '../domain/repository/training_repository.dart';
import '../domain/repository/user_repository.dart';
import '../domain/repository/weight_repository.dart';
import 'datasource/firebase_auth/user_datasource.dart';
import 'datasource/firestore/users_datasource.dart';
import 'datasource/firestore_trainings_datasource.dart';
import 'datasource/firestore_weights_datasource.dart';
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

/// Weight
///
///
final weightRepositoryProvider = Provider<IWeightRepository>(
  (ref) => WeightRepositoryImpl(
    dataSource: ref.watch(fireStoreWeightsDataSourceProvider),
    factory: ref.watch(weightFactoryProvider),
  ),
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
