import 'package:flutter/material.dart';
import 'package:bodquest_2023/presentation/component/main_widget.dart';
import 'package:bodquest_2023/presentation/component/main_left_drawer.dart';
import 'package:bodquest_2023/presentation/component/main_bottom_navigation_bar_widget.dart';
import 'package:bodquest_2023/presentation/component/component_types.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bodquest 2023',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem _currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.setting: GlobalKey<NavigatorState>(),
    TabItem.view1: GlobalKey<NavigatorState>(),
    TabItem.view2: GlobalKey<NavigatorState>(),
    TabItem.sampleCounter: GlobalKey<NavigatorState>(),
    TabItem.weight: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: MainLeftDrawer(),
      body: MainWidget(currentTab: _currentTab, navigatorKeys: _navigatorKeys),
      bottomNavigationBar: MainBottomNavigationBar(
        currentTab: _currentTab,
        onSelect: _selectTab,
      ),
    );
  }
}
