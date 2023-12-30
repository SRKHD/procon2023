import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/menu/add_menu_usecase.dart';
import '../../../domain/usecase/menu/get_menus_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../state/menu/menu_state.dart';

class MenuListNotifier extends StateNotifier<AsyncValue<List<MenuState>>> {
  MenuListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetMenusUsecase getMenusUsecase,
    required IAddMenuUsecase addMenuUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getMenusUsecase = getMenusUsecase,
        _addMenusUsecase = addMenuUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetMenusUsecase _getMenusUsecase;
  final IAddMenuUsecase _addMenusUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getMenusUsecase.execute(userId).listen((values) {
      state = AsyncValue.data(
          values.map((weight) => MenuState.fromEntity(weight)).toList());
    }).onError((e) => print(e));
  }

  void addMenu(
    String userId,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    String imageFilePath,
  ) {
    _addMenusUsecase.execute(
        userId, name, date, recipe, ingredient, calorie, imageFilePath);
  }
}
