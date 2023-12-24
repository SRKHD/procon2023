import 'package:flutter/material.dart';

class LevelText extends StatelessWidget {
  const LevelText({super.key, required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Level:'), Text('$level')],
    );
  }
}
