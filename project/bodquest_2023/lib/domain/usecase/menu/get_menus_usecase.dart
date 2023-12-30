import '../../entity/menu.dart';

abstract interface class IGetMenusUsecase {
  Stream<List<Menu>> execute(String userId);
}
