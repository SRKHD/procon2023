import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/datasource/firebase_auth/user_datasource.dart';
import '../infrastructure/datasource/firebase_auth/user_datasource_impl.dart';
import '../infrastructure/datasource/firebase_storage/storage_datasource.dart';
import '../infrastructure/datasource/firebase_storage/storage_datasource_impl.dart';
import '../infrastructure/datasource/firestore/meals_datasource.dart';
import '../infrastructure/datasource/firestore/meals_datasource_impl.dart';
import '../infrastructure/datasource/firestore/menus_datasource.dart';
import '../infrastructure/datasource/firestore/menus_datasource_impl.dart';
import '../infrastructure/datasource/firestore/trainings_datasource_impl.dart';
import '../infrastructure/datasource/firestore/users_datasource.dart';
import '../infrastructure/datasource/firestore/trainings_datasource.dart';
import '../infrastructure/datasource/firestore/users_datasource_impl.dart';
import '../infrastructure/datasource/firestore/weights_datasource.dart';
import '../infrastructure/datasource/firestore/weights_datasource_impl.dart';

/// Firebae Storage
///
///
final firebaseStorageDataSourceProvider = Provider<IFirebaseStorageDataSource>(
  (ref) => FirebaseStorageDataSourceImpl(),
);

/// User
///
///
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
final fireStoreWeightsDataSourceProvider =
    Provider<IFirestoreWeightsDataSource>(
  (ref) => FirestoreWeightsDataSourceImpl(),
);

/// Training
///
///
final fireStoreTrainingsDataSourceProvider =
    Provider<IFirestoreTrainingsDataSource>(
  (ref) => FirestoreTrainingsDataSourceImpl(),
);

/// Meal
///
///
final fireStoreMealsDataSourceProvider = Provider<IFirestoreMealsDataSource>(
  (ref) => FirestoreMealsDataSourceImpl(),
);

/// Menu
///
///
final fireStoreMenusDataSourceProvider = Provider<IFirestoreMenusDataSource>(
  (ref) => FirestoreMenusDataSourceImpl(),
);
