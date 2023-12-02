import '../../domain/entity/user.dart';
import '../../domain/factory/user_factory.dart';
import '../../domain/repository/user_repository.dart';
import '../datasource/firestore_datasource.dart';

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl({
    required IFirestoreDataSource dataSource,
    required IUserFactory factory,
  })  : fireStoreDataSource = dataSource,
        userFactory = factory;
  final IFirestoreDataSource fireStoreDataSource;
  final IUserFactory userFactory;

  @override
  Future<List<User>> findAll() async {
    try {
      final res = await fireStoreDataSource.getUsers();
      return res.results
          .map(
            (e) => userFactory.createFromModel(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
