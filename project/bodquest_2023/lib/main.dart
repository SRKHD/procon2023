import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bodquest_2023/presentation/component/main_widget.dart';
import 'package:bodquest_2023/presentation/component/main_left_drawer.dart';

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
  final _counterStream = StreamController<int>();

  // 初期化時にConsumerのコンストラクタにStreamを渡す
  @override
  void initState() {
    super.initState();
    Consumer(_counterStream);
  }

  // 終了時にStreamを解放する
  @override
  void dispose() {
    super.dispose();
    _counterStream.close();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // カウントアップした後に、Streamにカウンタ値を流す
    _counterStream.sink.add(_counter);
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Consumerクラス
class Consumer {
  //コンストラクタでint型のStreamを受け取る
  Consumer(StreamController<int> consumeStream) {
    // Streamをlistenしてデータが来たらターミナルに表示する
    consumeStream.stream.listen((data) async {
      print("consumerが$dataを使ったよ");
    });
  }
}
