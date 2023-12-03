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
  Future<List<Weight>> findAll() async {
    try {
      final res = await fireStoreDataSource.getWeights();
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
