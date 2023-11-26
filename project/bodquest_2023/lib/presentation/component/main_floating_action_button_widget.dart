import 'package:flutter/material.dart';

class MainFloatingActionButtonWidget extends StatefulWidget {
  MainFloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  State<MainFloatingActionButtonWidget> createState() =>
      _MainFloatingActionButtonWidgetState();
}

class _MainFloatingActionButtonWidgetState
    extends State<MainFloatingActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.home),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.person),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.scale),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.cloud),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
