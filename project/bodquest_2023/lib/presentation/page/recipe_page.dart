import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecipePage extends StatefulWidget {
  int counter = 10;

  RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
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
