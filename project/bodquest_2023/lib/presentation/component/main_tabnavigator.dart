import 'package:flutter/material.dart';
import 'package:bodquest_2023/presentation/component/component_types.dart';
import 'package:bodquest_2023/presentation/page/home_page.dart';
import 'package:bodquest_2023/presentation/page/weight_page.dart';
import 'package:bodquest_2023/presentation/component/sample_counter_widget.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    required this.tabItem,
    required this.routerName,
    required this.navigationKey,
  });

  final TabItem tabItem;
  final String routerName;
  final GlobalKey<NavigatorState>? navigationKey;

  Map<String, Widget Function(BuildContext)> _routerBuilder(
          BuildContext context) =>
      {
        '/home': (context) => HomePage(),
        '/setting': (context) => Placeholder(),
        '/weight': (context) => WeightPage(),
        '/sampleCounter': (context) => SampleCounterWidget(),
        '/view1': (context) => Placeholder(),
        '/view2': (context) => Placeholder(),
      };

  @override
  Widget build(BuildContext context) {
    final routerBuilder = _routerBuilder(context);

    return Navigator(
      key: navigationKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute<Widget>(
          builder: (context) {
            if (routerBuilder.containsKey(routerName)) {
              return routerBuilder[routerName]!(context);
            } else {
              return HomePage();
            }
          },
        );
      },
    );
  }
}
