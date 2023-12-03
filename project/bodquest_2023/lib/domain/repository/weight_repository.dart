import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/datasource/firestore_weights_datasource.dart';
import '../../infrastructure/repository/weight_repository_impl.dart';
import '../entity/weight.dart';
import '../factory/weight_factory.dart';

final weightRepositoryProvider = Provider<IWeightRepository>(
  (ref) => WeightRepositoryImpl(
    dataSource: ref.watch(fireStoreWeightsDataSourceProvider),
    factory: ref.watch(weightFactoryProvider),
  ),
);

abstract interface class IWeightRepository {
  /// ユーザー一覧の取得
  Future<List<Weight>> findAll();
}
