import 'package:flutter/material.dart';

import '../component_types.dart';

import '../control/editable_card.dart';

class MealListCard extends StatelessWidget {
  const MealListCard({
    super.key,
    required this.userId,
    required this.id,
    required this.kind,
    required this.date,
    required this.name,
    required this.calorie,
    required this.onPressed,
    required this.onPressedDelete,
  });
  final String userId;
  final String id;
  final String kind;
  final String date;
  final String name;
  final int calorie;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    final kindValue = MealKind.from(kind);
    final calorieText = calorie == -1 ? '' : '($calorie kcal)';
    return EditableCard(
      userId: userId,
      id: id,
      title: date,
      subtitle: switch (kindValue) {
        MealKind.breakfast => '朝食　　$name$calorieText',
        MealKind.lunch => '昼食　　$name$calorieText',
        MealKind.dinner => '夕食　　$name$calorieText',
        MealKind.snack => '間食　　$name$calorieText',
      },
      imagePath: '',
      onPressed: onPressed,
      onPressedDelete: onPressedDelete,
    );
  }
}
