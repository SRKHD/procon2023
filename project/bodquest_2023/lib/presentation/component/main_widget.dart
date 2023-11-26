import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bodquest_2023/presentation/component/sample_counter_widget.dart';
import 'package:bodquest_2023/presentation/page/home_page.dart';

// ignore: must_be_immutable
class MainWidget extends StatefulWidget {
  int mode = 0;
  StreamController<String> stringStream;

  MainWidget({Key? key, required this.mode, required this.stringStream})
      : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    Widget page = HomePage();
    switch (widget.mode) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = Placeholder();
        break;
      case 2:
        page = SampleCounterWidget(
          stringStream: widget.stringStream,
        );
        break;
      case 3:
        page = Placeholder();
        break;
      case 4:
        page = Placeholder();
        break;
    }
    return page;
  }
}
