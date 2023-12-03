import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/firestore/rug_get_users_response.dart';
import 'firestore_datasource_impl.dart';

final fireStoreDataSourceProvider = Provider<IFirestoreDataSource>(
  (ref) => FirestoreDataSourceImpl(),
);

abstract interface class IFirestoreDataSource {
  Future<RugGetUsersResponse> getUsers({int results});
}
