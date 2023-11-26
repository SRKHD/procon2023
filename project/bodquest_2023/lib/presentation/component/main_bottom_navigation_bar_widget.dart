import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainBottomNavigationBar extends StatefulWidget {
  int mode = 0;
  MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
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
          icon: Icon(Icons.cloud),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.settings),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      // 現在選択されているフッターメニューのインデックス
      currentIndex: widget.mode,
      // フッター領域の影
      elevation: 0,
      // フッターメニュータップ時の処理
      onTap: (int index) {
        widget.mode = index;
        setState(() {});
      },
      // 選択中フッターメニューの色
      fixedColor: Colors.red,
    );
  }
}
