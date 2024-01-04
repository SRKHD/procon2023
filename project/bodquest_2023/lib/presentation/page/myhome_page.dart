import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'sample/health_sample_page.dart';
// import '../component/main/main_bottom_navigation_bar.dart';
// import '../component/main/main_left_drawer.dart';
// import 'sample/sample_counter_page.dart';
// import '../notifier/index_notifier.dart';
import '../page/home_page.dart';
// import 'sample/yolov5_sample_page.dart';
// import 'training/training_page.dart';
// import 'weight/weight_page.dart';
// import 'user_page.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required String title});

  // final pages = [
  //   HomePage(),
  //   UserPage(),
  //   WeightPage(),
  //   TrainingPage(),
  //   SampleCounterPage(),
  //   HealthSamplePage(),
  //   YOLOv5Sample(),
  // ];

  @override
  Widget build(context, WidgetRef ref) {
    //final index = ref.watch(indexNotifierProvider);
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: BrandColor.moriGreen,
        //   title: Text(_title),
        // ),
        //drawer: MainLeftDrawer(),
        body: HomePage() //pages[index],
        // bottomNavigationBar: MainBottomNavigationBar(),
        );
  }
}
