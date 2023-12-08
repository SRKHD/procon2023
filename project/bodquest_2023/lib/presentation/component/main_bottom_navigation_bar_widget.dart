import 'package:flutter/material.dart';
import 'package:bodquest_2023/presentation/component/component_types.dart';

// ignore: must_be_immutable
class MainBottomNavigationBar extends StatelessWidget {
  MainBottomNavigationBar(
      {super.key, required this.currentTab, required this.onSelect});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelect;
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

  Widget _buildBttomNavigator(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      fixedColor: Colors.red,
      // 選択中フッターメニューの色
      type: BottomNavigationBarType.fixed,
      // 現在選択されているフッターメニューのインデックス
      currentIndex: 0,
      // フッター領域の影
      elevation: 0,
      onTap: (index) {
        onSelect(TabItem.values[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBttomNavigator(context);
  }
}
