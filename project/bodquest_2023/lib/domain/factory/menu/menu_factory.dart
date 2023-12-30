import '../../../infrastructure/model/firestore/menu/fug_menu.dart';
import '../../entity/menu.dart';

abstract interface class IMenuFactory {
  /// [Menu]を生成する
  Menu create({
    required String userId,
    required String name,
    required DateTime date,
    required int timestamp,
    required String recipe,
    required String ingredient,
    required int calorie,
    required String imageFilePath,
  });

  /// [FugMenu]から[Menu]を生成する
  Menu createFromModel(FugMenu meal);
}
