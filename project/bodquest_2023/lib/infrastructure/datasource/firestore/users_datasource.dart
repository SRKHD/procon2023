import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/firestore/rug_get_users_response.dart';
import 'users_datasource_impl.dart';

final fireStoreUsersDataSourceProvider = Provider<IFirestoreUsersDataSource>(
  (ref) => FirestoreUsersDataSourceImpl(),
);

abstract interface class IFirestoreUsersDataSource {
  Future<RugGetUsersResponse> getUsers({int results});
}
