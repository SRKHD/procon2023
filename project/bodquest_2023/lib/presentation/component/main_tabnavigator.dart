import 'package:flutter/material.dart';

import '../page/home_page.dart';
import '../page/training_page.dart';
import '../page/weight_page.dart';
import 'component_types.dart';
import 'health_sample_wedget.dart';
import 'sample_counter_widget.dart';

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
        '/training': (context) => TrainingPage(),
        '/sampleCounter': (context) => SampleCounterWidget(),
        '/view1': (context) => HealthWidget(),
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
