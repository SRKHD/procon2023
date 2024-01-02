import '../../core/util/datetime_utils.dart';
import '../../domain/entity/training.dart';
import '../../domain/factory/training/training_factory.dart';
import '../../domain/repository/training_repository.dart';
import '../datasource/firestore/trainings_datasource.dart';
import '../datasource/ios_healthia/ios_healthia_training_datasource.dart';

class TrainingRepositoryImpl implements ITrainingRepository {
  TrainingRepositoryImpl({
    required IFirestoreTrainingsDataSource dataSource,
    required ITrainingFactory factory,
    required IiOSHealthiaTrainingDatasource iOSDatasource,
  })  : fireStoreDataSource = dataSource,
        trainingFactory = factory,
        iOSHealthiaTrainingDatasource = iOSDatasource;
  final IFirestoreTrainingsDataSource fireStoreDataSource;
  final ITrainingFactory trainingFactory;
  final IiOSHealthiaTrainingDatasource iOSHealthiaTrainingDatasource;
  final List<DateTime> _registeredDates = [];

  @override
  Stream<List<Training>> get(String userId) {
    try {
      return fireStoreDataSource.get(userId).map((event) => [
            ...event.results.map((res) => trainingFactory.createFromModel(res))
          ]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> add(
    String userId,
    String kind,
    DateTime date,
    int value,
  ) {
    return fireStoreDataSource.add(userId, kind, date, value);
  }

  @override
  Future<int> synchronizeHealthia(String userId, DateTime date) {
    final prevMonth = getPrevMonth(date);
    final stream = fireStoreDataSource.get(userId);
    stream.listen(
      (event) {
        for (var element in event.results) {
          _registeredDates.add(element.date);
        }
      },
    );
    final healthiaTrainingsStream =
        iOSHealthiaTrainingDatasource.getTrainings(userId);
    healthiaTrainingsStream.listen((value) {
      for (final value in value.results) {
        if (_registeredDates.contains(value.date)) continue;

        if (value.date.isAfter(prevMonth)) {
          add(userId, value.kind.value, value.date, value.value);
        }
      }
    });
    return Future.value(0);
  }

  @override
  Future<int> delete(String userId, String id) {
    return fireStoreDataSource.delete(userId, id);
  }

  @override
  Future<int> update(
      String userId, String id, String kind, DateTime date, int value) {
    return fireStoreDataSource.update(userId, id, kind, date, value);
  }
}
