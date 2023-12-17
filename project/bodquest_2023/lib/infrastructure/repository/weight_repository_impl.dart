import '../../domain/entity/weight.dart';
import '../../domain/factory/weight_factory.dart';
import '../../domain/repository/weight_repository.dart';
import '../datasource/firestore_weights_datasource.dart';

class WeightRepositoryImpl implements IWeightRepository {
  WeightRepositoryImpl({
    required IFirestoreWeightsDataSource dataSource,
    required IWeightFactory factory,
  })  : fireStoreDataSource = dataSource,
        weightFactory = factory;
  final IFirestoreWeightsDataSource fireStoreDataSource;
  final IWeightFactory weightFactory;

  @override
  Stream<List<Weight>> findAll(String userId) {
    try {
      return fireStoreDataSource.getWeights(userId).map((event) =>
          [...event.results.map((res) => weightFactory.createFromModel(res))]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addWeight(String userId, double value) {
    return fireStoreDataSource.addWeight(userId, value);
  }
}
