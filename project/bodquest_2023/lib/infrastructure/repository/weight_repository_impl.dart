import '../../core/util/datetime_utils.dart';
import '../../domain/entity/weight.dart';
import '../../domain/factory/weight/weight_factory.dart';
import '../../domain/repository/weight_repository.dart';
import '../datasource/firestore/weights_datasource.dart';
import '../datasource/ios_healthia/ios_healthia_weight_datasource.dart';
import '../model/firestore/weight/fug_get_weights_response.dart';

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
  Future<int> synchronizeHealthiaWeights(String userId, DateTime date) async {
    print('-----1');
    final prevMonth = getPrevMonth(date);
    List<DateTime> registeredDates = [];
    // final registeredWeightsResponse = await fireStoreDataSource
    //     .getWeights(userId)
    //     .any((element) => false);
    // final registeredWeights = registeredWeightsResponse.results;
    print('-----2');
    final stream = fireStoreDataSource.getWeights(userId);
    print('-----2-0');
    final len = await stream.length;
    await for (final element in stream) {
      //
      print('-----2-1 $element');
      final length = element.results.length;
      print('-----2-2 $length');
      element.results.map((e) {
        print('-----2-3 $e');
        registeredDates.add(e.date);
        print('-----2-4 $registeredDates');
      });
      print('-----2-5 $registeredDates');
    }
    /*
    await fireStoreDataSource.getWeights(userId).forEach((element) {
      //
      //
      print('-----2-1 $element');
      element.results.map((e) => registeredDates.add(e.date));
      print('-----2-2 $registeredDates');
      return;
    });
     */
    /*
    await a.then((value) {
      //
      print('-----2-1 $value');
      if (value is FugGetWeightsResponse) {
        value.results.map((e) => registeredDates.add(e.date));
        print('-----2-2 $registeredDates');
      }
    });
    */
    print('-----3');
    final healthiaWeightsStream =
        iOSHealthiaWeightDatasource.getWeights(userId);
    healthiaWeightsStream.listen((value) {
      for (final value in value.results) {
        print('-----4 $value');
        // if (!registeredWeights.any(
        //     (element) => element.date.isAtSameMomentAs(value.date))) continue;
        // final isResistered = fireStoreDataSource.getWeights(userId).any(
        //     (weights) => weights.results
        //         .any((weight) => weight.date.isAtSameMomentAs(value.date)));
        // final b = isResistered;
        // if (isResistered.) continue;
        print('-----4-1 $registeredDates');
        if (registeredDates.contains(value.date)) continue;

        if (value.date.isAfter(prevMonth)) {
          addWeight(userId, value.date, value.value);
        }
      }
    });
    print('-----5');
    return Future.value(0);
  }
}
