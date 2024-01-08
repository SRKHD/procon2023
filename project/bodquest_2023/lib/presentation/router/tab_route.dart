import 'package:flutter/material.dart';

import '../page/myhome_page.dart';
import '../page/training/training_page.dart';
import '../page/user_page.dart';
import '../page/weight/weight_page.dart';
import '../page/recipe_page.dart';
import '../theme/images.dart';
import '../theme/l10n.dart';

/// 画面とアイコンとラベル
class TabRoute {
  const TabRoute({
    required this.body,
    required this.icon,
    required this.label,
  });

  // 画面
  final Widget Function() body;
  // アイコン
  final String icon;
  // ラベル
  final String label;
}

// 実際のデータを決めていく
final routes = [
  TabRoute(
    body: () => UserPage(),
    icon: TabImage.user.path,
    label: L10n.user,
  ),
  TabRoute(
    body: () => WeightPage(),
    icon: TabImage.weight.path,
    label: L10n.weight,
  ),
  TabRoute(
    body: () => MyHomePage(title: 'Flutter Demo Home Page'),
    icon: TabImage.home.path,
    label: L10n.home,
  ),
  TabRoute(
    body: () => TrainingPage(),
    icon: TabImage.training.path,
    label: L10n.training,
  ),
  TabRoute(
    body: () => RecipePage(),
    icon: TabImage.meal.path,
    label: L10n.meal,
  ),
  //TabRoute(
  //body: () => Placeholder(),
  //icon: TabImage.setting.path,
  //label: L10n.setting,
  //),
];
