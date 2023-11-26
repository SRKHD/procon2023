import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SampleCounterWidget extends StatefulWidget {
  int counter = 0;

  SampleCounterWidget({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}
