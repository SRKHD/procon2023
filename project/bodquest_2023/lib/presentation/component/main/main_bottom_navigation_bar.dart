import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifier/index_notifier.dart';
import '../../theme/colors.dart';

// ignore: must_be_immutable
class MainBottomNavigationBar extends ConsumerWidget {
  MainBottomNavigationBar({super.key});

  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.person),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.scale),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.sports_handball),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.arrow_upward),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.cloud),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(context, WidgetRef ref) {
    final index = ref.watch(indexNotifierProvider);
    return BottomNavigationBar(
      items: items,
      backgroundColor: BrandColor.moriGreen,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      //fixedColor: Colors.red,
      // 選択中フッターメニューの色
      type: BottomNavigationBarType.fixed,
      // 現在選択されているフッターメニューのインデックス
      currentIndex: index,
      // フッター領域の影
      elevation: 0,
      onTap: (index) {
        final notifier = ref.read(indexNotifierProvider.notifier);
        notifier.save(index);
      },
    );
  }
}
