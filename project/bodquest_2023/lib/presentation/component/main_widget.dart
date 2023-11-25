import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bodquest_2023/presentation/component/sample_counter_widget.dart';

class MainWidget extends StatefulWidget {
  int counter = 0;
  StreamController<String> stringStream;

  MainWidget({Key? key, required this.counter, required this.stringStream})
      : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return SampleCounterWidget(
      counter: widget.counter,
      stringStream: widget.stringStream,
    );
  }
}
