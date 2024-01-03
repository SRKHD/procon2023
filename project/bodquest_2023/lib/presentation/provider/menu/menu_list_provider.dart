import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/menu/menu_state.dart';
import '../../usecaese_provider_module.dart';
import '../../notifier/menu/menu_list_notifier.dart';

final menuListNotifierProvider =
    StateNotifierProvider<MenuListNotifier, AsyncValue<List<MenuState>>>(
  (ref) => MenuListNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getUsecase: ref.read(getMenusUsecaseProvider),
    addUsecase: ref.read(addMenuUsecaseProvider),
    deleteUsecase: ref.read(deleteMenuUsecaseProvider),
    updateUsecase: ref.read(updateMenuUsecaseProvider),
  ),
);
