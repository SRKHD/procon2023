import 'package:flutter/material.dart';

import '../control/editable_card.dart';

class MenuListCard extends StatelessWidget {
  const MenuListCard({
    super.key,
    required this.userId,
    required this.id,
    required this.recipe,
    required this.onPressed,
    required this.onPressedDelete,
  });
  final String userId;
  final String id;
  final String recipe;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return EditableCard(
      userId: userId,
      id: id,
      title: recipe,
      subtitle: '',
      imagePath: '',
      onPressed: onPressed,
      onPressedDelete: onPressedDelete,
    );
  }
}
