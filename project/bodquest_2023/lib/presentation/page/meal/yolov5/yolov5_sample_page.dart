import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../component/meal/yolov5/runmodel_bycamera_demo.dart';

//import 'home_screen.dart';

//import 'RunModelByImageDemo.dart';

class YOLOv5Sample extends ConsumerWidget {
  YOLOv5Sample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //return HomeScreen();
    return RunModelByCameraDemo();
  }
}
