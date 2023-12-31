import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/ability_tab_bar.dart';
import '../provider/function_tab_provider.dart';
import '../router/tab_route.dart';
import '../theme/sizes.dart';

class BaseRootPage extends ConsumerWidget {
  BaseRootPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final controller = ref.watch(pageControllerProvider);
    final screenSize = MediaQuery.of(context).size;
    final design = DesignSize(screenSize.width);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: routes.length,
              itemBuilder: (_, i) => routes[i].body(),
            ),
          ),
          SizedBox(
            height: design.tabBarH,
            child: const AbilityTabBar(),
          ),
        ],
      ),
    );
  }
}
