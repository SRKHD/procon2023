import '../../entity/weight.dart';

abstract interface class IGetWeightsUsecase {
  Stream<List<Weight>> execute(String userId);
}
