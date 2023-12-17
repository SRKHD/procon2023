import 'package:flutter/material.dart';

import 'component_types.dart';
import 'main_tabnavigator.dart';

class MainWidget extends StatelessWidget {
  MainWidget(
      {super.key, required this.currentTab, required this.navigatorKeys});
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
          TabItem.weight,
          '/weight',
        ),
        _buildTabItem(
          TabItem.training,
          '/training',
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
