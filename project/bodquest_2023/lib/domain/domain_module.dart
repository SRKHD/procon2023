import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/data_module.dart';
import '../infrastructure/factory/training/training_factory_impl.dart';
import '../infrastructure/factory/training/training_kind_factory_impl.dart';
import '../infrastructure/factory/user/user_factory_impl.dart';
import '../infrastructure/factory/user/user_gender_factory_impl.dart';
import '../infrastructure/factory/weight/weight_factory_impl.dart';
import 'application/usecase/training/add_training_usecase_impl.dart';
import 'application/usecase/user/add_user_usecase_impl.dart';
import 'application/usecase/weight/add_weight_usecase_impl.dart';
import 'application/usecase/user/get_login_user_usecase_impl.dart';
import 'application/usecase/training/get_trainings_usecase_impl.dart';
import 'application/usecase/user/get_users_usecase_impl.dart';
import 'application/usecase/weight/get_weights_usecase_impl.dart';
import 'factory/training/training_factory.dart';
import 'factory/training/training_kind_factory.dart';
import 'factory/user/user_factory.dart';
import 'factory/user/user_gender_factory.dart';
import 'factory/weight/weight_factory.dart';
import 'usecase/training/add_training_usecase.dart';
import 'usecase/user/add_user_usecase.dart';
import 'usecase/weight/add_weight_usecase.dart';
import 'usecase/user/get_login_user_usecase.dart';
import 'usecase/training/get_trainings_usecase.dart';
import 'usecase/user/get_users_usecase.dart';
import 'usecase/weight/get_weights_usecase.dart';

/// User
///
///
final getUsersUsecaseProvider = Provider<IGetUsersUsecase>(
  (ref) => GetUsersUsecaseImpl(
    userRepository: ref.watch(userRepositoryProvider),
  ),
);

final getLogInUserUsecaseProvider = Provider<IGetLogInUserUsecase>(
  (ref) => GetLogInUserUsecaseImpl(
    userRepository: ref.watch(userRepositoryProvider),
  ),
);

final userFactoryProvider = Provider<IUserFactory>(
  (ref) => UserFactoryImpl(
    factory: ref.watch(userGenderFactoryProvider),
  ),
);

final userGenderFactoryProvider = Provider<IUserGenderFactory>(
  (ref) => UserGenderFactoryImpl(),
);

final addUserUsecaseProvider = Provider<IAddUserUsecase>(
  (ref) => AddUserUsecaseImpl(
    repository: ref.watch(userRepositoryProvider),
  ),
);

/// Weight
///
///
final getWeightsUsecaseProvider = Provider<IGetWeightsUsecase>(
  (ref) => GetWeightsUsecaseImpl(
    repository: ref.watch(weightRepositoryProvider),
  ),
);

final addWeightUsecaseProvider = Provider<IAddWeightUsecase>(
  (ref) => AddWeightUsecaseImpl(
    repository: ref.watch(weightRepositoryProvider),
  ),
);

final weightFactoryProvider = Provider<IWeightFactory>(
  (ref) => WeightFactoryImpl(),
);

/// Training
///
///
final getTrainingsUsecaseProvider = Provider<IGetTrainingsUsecase>(
  (ref) => GetTrainingsUsecaseImpl(
    repository: ref.watch(trainingRepositoryProvider),
  ),
);

final addTrainingUsecaseProvider = Provider<IAddTrainingUsecase>(
  (ref) => AddTrainingUsecaseImpl(
    repository: ref.watch(trainingRepositoryProvider),
  ),
);

final trainingFactoryProvider = Provider<ITrainingFactory>(
  (ref) => TrainingFactoryImpl(
    factory: ref.watch(trainingKindFactoryProvider),
  ),
);

final trainingKindFactoryProvider = Provider<ITrainingKindFactory>(
  (ref) => TrainingKindFactoryImpl(),
);
