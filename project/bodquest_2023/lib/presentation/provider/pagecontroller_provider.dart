import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/tabbar_config.dart';

/// 画面の横移動を管理するページコントローラー
final pageControllerProvider = Provider(
  (ref) {
    const iniIndex = TabBarConfig.initialIndex;
    final controller = PageController(initialPage: iniIndex);
    ref.onDispose(controller.dispose);
    return controller;
  },
);
