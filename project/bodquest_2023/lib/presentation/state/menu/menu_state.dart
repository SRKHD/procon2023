import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/menu.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  factory MenuState({
    required String userId,
    required String name,
    required String date,
    required int timestamp,
    required String recipe,
    required String ingredient,
    required int calorie,
    required String imageURL,
  }) = _MenuState;

  factory MenuState.fromEntity(Menu target) {
    return MenuState(
      userId: target.userId,
      name: target.name,
      date: '${target.date.year}年${target.date.month}月${target.date.day}日',
      timestamp: target.timestamp,
      recipe: target.recipe,
      ingredient: target.ingredient,
      calorie: target.calorie,
      imageURL: target.imageFilePath,
    );
  }
}
