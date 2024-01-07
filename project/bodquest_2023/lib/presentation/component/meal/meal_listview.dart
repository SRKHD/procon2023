import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/meal/meal_state.dart';
import 'meal_list_card.dart';

class MealListView extends ConsumerWidget {
  const MealListView({
    super.key,
    required this.meals,
    required this.onPressed,
    required this.onPressedDelete,
  });

  final List<MealState> meals;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealListCard(
        userId: meals[index].userId,
        id: meals[index].id,
        kind: meals[index].kind,
        date: meals[index].date,
        name: meals[index].name,
        calorie: meals[index].calorie,
        onPressed: onPressed,
        onPressedDelete: onPressedDelete,
      ),
    ); // return Expanded(
  }
}
