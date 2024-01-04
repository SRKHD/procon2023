import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SampleCounterPage extends StatefulWidget {
  int counter = 0;

  SampleCounterPage({super.key});

  @override
  State<SampleCounterPage> createState() => _SampleCounterPageState();
}

class _SampleCounterPageState extends State<SampleCounterPage> {
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
