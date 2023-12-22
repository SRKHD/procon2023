import '../entity/training.dart';

/// ユーザー一覧を取得する
abstract interface class IGetTrainingsUsecase {
  Stream<List<Training>> execute(String userId);
}
