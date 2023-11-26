import 'package:flutter/material.dart';
import 'package:bodquest_2023/presentation/component/main_tabnavigator.dart';
import 'package:bodquest_2023/presentation/component/component_types.dart';

class MainWidget extends StatelessWidget {
  MainWidget({Key? key, required this.currentTab, required this.navigatorKeys})
      : super(key: key);
  final TabItem currentTab;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  Widget _buildTabItem(
    TabItem tabItem,
    String root,
  ) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigationKey: navigatorKeys[tabItem],
        tabItem: tabItem,
        routerName: root,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildTabItem(
          TabItem.home,
          '/home',
        ),
        _buildTabItem(
          TabItem.setting,
          '/setting',
        ),
        _buildTabItem(
          TabItem.sampleCounter,
          '/sampleCounter',
        ),
        _buildTabItem(
          TabItem.view1,
          '/view1',
        ),
        _buildTabItem(
          TabItem.view2,
          '/view2',
        ),
      ],
    );
  }
}
