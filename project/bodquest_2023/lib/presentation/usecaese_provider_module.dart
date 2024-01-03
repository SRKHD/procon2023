import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/usecase/meal/delete_meal_usecase_impl.dart';
import '../application/usecase/meal/update_meal_usecase_impl.dart';
import '../application/usecase/menu/add_menu_usecase_impl.dart';
import '../application/usecase/menu/delete_menu_usecase_impl.dart';
import '../application/usecase/menu/get_menus_usecase_impl.dart';
import '../application/usecase/menu/update_menu_usecase_impl.dart';
import '../application/usecase/training/delete_training_usecase_impl.dart';
import '../application/usecase/training/synchronize_healthia_trainings_usecase_impl.dart';
import '../application/usecase/training/update_training_usecase_impl.dart';
import '../application/usecase/user/update_user_name_impl.dart';
import '../application/usecase/weight/delete_weight_usecase_impl.dart';
import '../application/usecase/weight/synchronize_healthia_weights_usecase_impl.dart';
import '../application/usecase/weight/update_weight_usecase_impl.dart';
import '../domain/usecase/meal/delete_meal_usecase.dart';
import '../domain/usecase/meal/update_meal_usecase.dart';
import '../domain/usecase/menu/add_menu_usecase.dart';
import '../domain/usecase/menu/delete_menu_usecase.dart';
import '../domain/usecase/menu/get_menus_usecase.dart';
import '../domain/usecase/menu/update_menu_usecase.dart';
import '../domain/usecase/training/delete_training_usecase.dart';
import '../domain/usecase/training/synchronize_healthia_trainings_usecase.dart';
import '../domain/usecase/training/update_training_usecase.dart';
import '../domain/usecase/user/update_user_name_usecase.dart';
import '../domain/usecase/weight/delete_weight_usecase.dart';
import '../domain/usecase/weight/synchronize_healthia_weights_usecase.dart';
import '../domain/usecase/weight/update_weight_usecase.dart';
import 'provider/evaluation/evaluation_provider.dart';
import 'repository_module.dart';
import '../application/usecase/evaluation/calculate_evaluation_impl.dart';
import '../application/usecase/meal/add_meal_usecase_impl.dart';
import '../application/usecase/meal/get_meals_usecase_impl.dart';
import '../application/usecase/training/add_training_usecase_impl.dart';
import '../application/usecase/training/get_calories_consumed_usecase_impl.dart';
import '../application/usecase/user/add_user_usecase_impl.dart';
import '../application/usecase/user/get_ideal_usecase_impl.dart';
import '../application/usecase/weight/add_weight_usecase_impl.dart';
import '../application/usecase/user/get_login_user_usecase_impl.dart';
import '../application/usecase/training/get_trainings_usecase_impl.dart';
import '../application/usecase/user/get_users_usecase_impl.dart';
import '../application/usecase/weight/get_weights_usecase_impl.dart';
import '../domain/usecase/evaluation/calculate_evaluation_usecase.dart';
import '../domain/usecase/meal/add_meal_usecase.dart';
import '../domain/usecase/meal/get_meals_usecase.dart';
import '../domain/usecase/training/add_training_usecase.dart';
import '../domain/usecase/training/get_calories_consumed_usecase.dart';
import '../domain/usecase/user/add_user_usecase.dart';
import '../domain/usecase/user/get_ideal_usecase.dart';
import '../domain/usecase/weight/add_weight_usecase.dart';
import '../domain/usecase/user/get_login_user_usecase.dart';
import '../domain/usecase/training/get_trainings_usecase.dart';
import '../domain/usecase/user/get_users_usecase.dart';
import '../domain/usecase/weight/get_weights_usecase.dart';

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

final addUserUsecaseProvider = Provider<IAddUserUsecase>(
  (ref) => AddUserUsecaseImpl(
    repository: ref.watch(userRepositoryProvider),
  ),
);

final updateUserInfoUsecaseProvider = Provider<IUpdateUserInfoUsecase>(
  (ref) => UpdateUserInfoUsecaseImpl(
    repository: ref.watch(userRepositoryProvider),
  ),
);

final getIdealUsecaseProvider = Provider<IGetIdealUsecase>(
  (ref) => GetIdealUsecaseImpl(),
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

final deleteWeightUsecaseProvider = Provider<IDeleteWeightUsecase>(
  (ref) => DeleteWeightUsecaseImpl(
    repository: ref.watch(weightRepositoryProvider),
  ),
);

final updateWeightUsecaseProvider = Provider<IUpdateWeightUsecase>(
  (ref) => UpdateWeightUsecaseImpl(
    repository: ref.watch(weightRepositoryProvider),
  ),
);

final synchronizeHealthiaWeightsUsecaseProvider =
    Provider<ISynchronizeHealthiaWeightsUsecase>(
        (ref) => SynchronizeHealthiaWeightsUsecaseImpl(
              repository: ref.watch(weightRepositoryProvider),
            ));

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

final deleteTrainingUsecaseProvider = Provider<IDeleteTrainingUsecase>(
  (ref) => DeleteTrainingUsecaseImpl(
    repository: ref.watch(trainingRepositoryProvider),
  ),
);

final updateTrainingUsecaseProvider = Provider<IUpdateTrainingUsecase>(
  (ref) => UpdateTrainingUsecaseImpl(
    repository: ref.watch(trainingRepositoryProvider),
  ),
);

final getCaloriesConsumedUsecaseProvider =
    Provider<IGetCaloriesConsumedUsecase>(
  (ref) => GetCaloriesConsumedUsecaseImpl(),
);

final synchronizeHealthiaTrainingsUsecaseProvider =
    Provider<ISynchronizeHealthiaTrainingsUsecase>(
        (ref) => SynchronizeHealthiaTrainingsUsecaseImpl(
              repository: ref.watch(trainingRepositoryProvider),
            ));

/// Meal
///
///
final getMealsUsecaseProvider = Provider<IGetMealsUsecase>(
  (ref) => GetMealsUsecaseImpl(
    repository: ref.watch(mealRepositoryProvider),
  ),
);

final addMealUsecaseProvider = Provider<IAddMealUsecase>(
  (ref) => AddMealUsecaseImpl(
    repository: ref.watch(mealRepositoryProvider),
  ),
);

final deleteMealUsecaseProvider = Provider<IDeleteMealUsecase>(
  (ref) => DeleteMealUsecaseImpl(
    repository: ref.watch(mealRepositoryProvider),
  ),
);

final updateMealUsecaseProvider = Provider<IUpdateMealUsecase>(
  (ref) => UpdateMealUsecaseImpl(
    repository: ref.watch(mealRepositoryProvider),
  ),
);

/// Evaluation
///
///
final calculateEvaluationUsecase = Provider<ICalculateEvaluationUsecase>(
  (ref) => CalculateEvaluationUsecaseImpl(
    getLogInUserUsecase: ref.watch(getLogInUserUsecaseProvider),
    trainingRepository: ref.watch(trainingRepositoryProvider),
    weightRepository: ref.watch(weightRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
    getIdealUsecase: ref.watch(getIdealUsecaseProvider),
    mealRepository: ref.watch(mealRepositoryProvider),
    getCaloriesConsumedUsecase: ref.watch(getCaloriesConsumedUsecaseProvider),
    evaluationNotifier: ref.watch(evaluationNotifierProvider.notifier),
  ),
);

/// Menu
///
///
final getMenusUsecaseProvider = Provider<IGetMenusUsecase>(
  (ref) => GetMenusUsecaseImpl(
    repository: ref.watch(menuRepositoryProvider),
  ),
);

final addMenuUsecaseProvider = Provider<IAddMenuUsecase>(
  (ref) => AddMenuUsecaseImpl(
    repository: ref.watch(menuRepositoryProvider),
  ),
);

final deleteMenuUsecaseProvider = Provider<IDeleteMenuUsecase>(
  (ref) => DeleteMenuUsecaseImpl(
    repository: ref.watch(menuRepositoryProvider),
  ),
);

final updateMenuUsecaseProvider = Provider<IUpdateMenuUsecase>(
  (ref) => UpdateMenuUsecaseImpl(
    repository: ref.watch(menuRepositoryProvider),
  ),
);
