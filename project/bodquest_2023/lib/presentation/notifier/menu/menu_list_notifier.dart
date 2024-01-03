import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/menu/add_menu_usecase.dart';
import '../../../domain/usecase/menu/delete_menu_usecase.dart';
import '../../../domain/usecase/menu/get_menus_usecase.dart';
import '../../../domain/usecase/menu/update_menu_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../state/menu/menu_state.dart';

class MenuListNotifier extends StateNotifier<AsyncValue<List<MenuState>>> {
  MenuListNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetMenusUsecase getUsecase,
    required IAddMenuUsecase addUsecase,
    required IDeleteMenuUsecase deleteUsecase,
    required IUpdateMenuUsecase updateUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getUsecase = getUsecase,
        _addUsecase = addUsecase,
        _deleteUsecase = deleteUsecase,
        _updateUsecase = updateUsecase,
        super(const AsyncLoading()) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetMenusUsecase _getUsecase;
  final IAddMenuUsecase _addUsecase;
  final IDeleteMenuUsecase _deleteUsecase;
  final IUpdateMenuUsecase _updateUsecase;

  /// 一覧の同期
  Future<void> _fetch(String userId) async {
    _getUsecase.execute(userId).listen((values) {
      state = AsyncValue.data(
          values.map((weight) => MenuState.fromEntity(weight)).toList());
    }).onError((e) => print(e));
  }

  void add(
    String userId,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    String imageFilePath,
  ) {
    _addUsecase.execute(
        userId, name, date, recipe, ingredient, calorie, imageFilePath);
  }

  void delete(
    String userId,
    String id,
  ) {
    _deleteUsecase.execute(userId, id);
  }

  void update(
    String userId,
    String id,
    String name,
    DateTime date,
    String recipe,
    String ingredient,
    int calorie,
    String imageFilePath,
  ) {
    _updateUsecase.execute(
        userId, id, name, date, recipe, ingredient, calorie, imageFilePath);
  }
}
