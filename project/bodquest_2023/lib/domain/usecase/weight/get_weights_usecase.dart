import '../../entity/weight.dart';

/// ユーザー一覧を取得する
abstract interface class IGetWeightsUsecase {
  Stream<List<Weight>> execute(String userId);
}
