import 'package:flutter/material.dart';

class PercentBarGraph extends StatelessWidget {
  const PercentBarGraph({
    super.key,
    required this.width,
    required this.height,
    required this.percentValue,
    required this.onPressed,
  });

  final double width;
  final double height;
  final int percentValue;

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final buttonwidth = width * (percentValue / 100);
    final valueButton = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: Size(buttonwidth, height)),
      child: null,
    );
    final rangeButton = ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, minimumSize: Size(width, height)),
      child: null,
    );

    final percentPanel = Stack(
      children: [rangeButton, valueButton],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [percentPanel, Text('$percentValue %')],
    );
  }
}
