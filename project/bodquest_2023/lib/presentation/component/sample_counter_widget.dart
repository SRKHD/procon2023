import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class SampleCounterWidget extends StatefulWidget {
  int counter = 0;
  StreamController<String> stringStream;

  SampleCounterWidget({Key? key, required this.stringStream}) : super(key: key);

  @override
  State<SampleCounterWidget> createState() => _SampleCounterWidgetState();
}

class _SampleCounterWidgetState extends State<SampleCounterWidget> {
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${widget.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton.icon(
            onPressed: _incrementCounter,
            label: Text('Increment'),
            icon: const Icon(Icons.add),
          ),
          StreamBuilder<String>(
            stream: widget.stringStream.stream,
            initialData: "",
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
        ],
      ),
    );
  }
}
