import 'package:bodquest_2023/presentation/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/weight/health_sample.dart';
import '../component/main/main_bottom_navigation_bar.dart';
import '../component/main/main_left_drawer.dart';
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
    UserPage(),
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
