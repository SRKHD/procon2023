import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/colors.dart';
import 'health_sample_page.dart';
import '../component/main/main_bottom_navigation_bar.dart';
import '../component/main/main_left_drawer.dart';
import 'sample_counter_page.dart';
import '../notifier/index_notifier.dart';
import '../page/home_page.dart';
import '../page/training_page.dart';
import '../page/weight_page.dart';
import 'user_page.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required String title}) : _title = title;
  final String _title;

  final pages = [
    HomePage(),
    UserPage(),
    WeightPage(),
    TrainingPage(),
    SampleCounterPage(),
    HealthSamplePage(),
    Placeholder(),
  ];

  @override
  Widget build(context, WidgetRef ref) {
    final index = ref.watch(indexNotifierProvider);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: BrandColor.moriGreen,
      //   title: Text(_title),
      // ),
      drawer: MainLeftDrawer(),
      body: pages[index],
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
