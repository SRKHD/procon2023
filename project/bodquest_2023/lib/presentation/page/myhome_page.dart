import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/health_sample.dart';
import '../component/main_bottom_navigation_bar.dart';
import '../component/main_left_drawer.dart';
import '../component/sample_counter.dart';
import '../notifier/index_notifier.dart';
import '../page/home_page.dart';
import '../page/training_page.dart';
import '../page/weight_page.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required String title}) : _title = title;
  final String _title;

  final pages = [
    HomePage(),
    Placeholder(),
    WeightPage(),
    TrainingPage(),
    SampleCounterWidget(),
    HealthWidget(),
    Placeholder(),
  ];

  @override
  Widget build(context, WidgetRef ref) {
    final index = ref.watch(indexNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
      ),
      drawer: MainLeftDrawer(),
      body: pages[index],
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
