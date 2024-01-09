import 'package:bodquest_2023/presentation/state/menu/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'menu_list_card.dart';

class MenuListView extends ConsumerWidget {
  const MenuListView({
    super.key,
    required this.menus,
    required this.onPressed,
    required this.onPressedDelete,
  });

  final List<MenuState> menus;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (ctx, index) => MenuListCard(
        userId: menus[index].userId,
        id: menus[index].id,
        recipe: menus[index].recipe,
        onPressed: onPressed,
        onPressedDelete: onPressedDelete,
      ),
    ); // return Expanded(
  }
}
