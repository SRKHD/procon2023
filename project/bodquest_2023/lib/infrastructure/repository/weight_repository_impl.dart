import '../../domain/entity/weight.dart';
import '../../domain/factory/weight_factory.dart';
import '../../domain/repository/weight_repository.dart';
import '../datasource/firestore_weights_datasource.dart';

class WeightRepositoryImpl implements IWeightRepository {
  WeightRepositoryImpl({
    required IFirestoreWeightsDataSource dataSource,
    required IWeightFactory factory,
  })  : fireStoreDataSource = dataSource,
        userFactory = factory;
  final IFirestoreWeightsDataSource fireStoreDataSource;
  final IWeightFactory userFactory;

  @override
  Stream<List<Weight>> findAll() {
    try {
      return fireStoreDataSource.getWeights().map((event) =>
          [...event.results.map((res) => userFactory.createFromModel(res))]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addUser(String userId, double value) {
    return fireStoreDataSource.addWeight(userId, value);
  }
}
