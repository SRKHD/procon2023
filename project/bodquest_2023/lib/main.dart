import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bodquest_2023/presentation/component/main_widget.dart';
import 'package:bodquest_2023/presentation/component/main_left_drawer.dart';
import 'package:bodquest_2023/presentation/component/main_floating_action_button_widget.dart';
import 'package:bodquest_2023/presentation/bloc/bloc_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bodquest 2023',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // Stream
  var intStream = StreamController<int>();
  var stringStream = StreamController<String>.broadcast();

  // 初期化時にConsumerのコンストラクタにStreamを渡す
  @override
  void initState() {
    super.initState();
    Generator(intStream);
    Coordinator(intStream, stringStream);
    Consumer(stringStream);
  }

  // 終了時にStreamを解放する
  @override
  void dispose() {
    super.dispose();
    intStream.close();
    stringStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: MainLeftDrawer(),
      body: MainWidget(
        counter: _counter,
        stringStream: stringStream,
      ),
      floatingActionButton: MainFloatingActionButtonWidget(),
    );
  }
}
