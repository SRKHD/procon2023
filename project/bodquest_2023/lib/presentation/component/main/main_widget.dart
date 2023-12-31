import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifier/index_notifier.dart';
import '../../page/home_page.dart';
import '../../page/training_page.dart';
import '../../page/user_page.dart';
import '../../page/weight_page.dart';
import '../weight/health_sample.dart';
import '../sample_counter.dart';

class MainWidget extends ConsumerWidget {
  MainWidget({super.key});

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
      body: pages[index],
    );
  }
}
