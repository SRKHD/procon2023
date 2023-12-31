import '../../core/util/datetime_utils.dart';
import '../../domain/entity/weight.dart';
import '../../domain/factory/weight/weight_factory.dart';
import '../../domain/repository/weight_repository.dart';
import '../datasource/firestore/weights_datasource.dart';
import '../datasource/ios_healthia/ios_healthia_weight_datasource.dart';

class WeightRepositoryImpl implements IWeightRepository {
  WeightRepositoryImpl({
    required IWeightFactory factory,
    required IFirestoreWeightsDataSource dataSource,
    required IiOSHealthiaWeightDatasource iOSDatasource,
  })  : weightFactory = factory,
        fireStoreDataSource = dataSource,
        iOSHealthiaWeightDatasource = iOSDatasource;
  final IWeightFactory weightFactory;
  final IFirestoreWeightsDataSource fireStoreDataSource;
  final IiOSHealthiaWeightDatasource iOSHealthiaWeightDatasource;

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
  Future<int> addWeight(String userId, DateTime date, double value) {
    return fireStoreDataSource.addWeight(userId, date, value);
  }

  @override
  Future<int> synchronizeHealthiaWeights(String userId, DateTime date) {
    final prevMonth = getPrevMonth(date);
    //final weightsStream = iOSHealthiaWeightDatasource.getWeights(userId);
    // weightsStream.listen((value) {
    //   for (final value in value.results) {
    //     if (value.date.isAfter(prevMonth)) {
    //       addWeight(userId, date, value.value);
    //     }
    //   }
    // });
    final response = iOSHealthiaWeightDatasource.getWeights(userId);
    response.then((value) {
      for (final value in value.results) {
        if (value.date.isAfter(prevMonth)) {
          addWeight(userId, date, value.value);
        }
      }
    });
    return Future.value(0);
  }
}
