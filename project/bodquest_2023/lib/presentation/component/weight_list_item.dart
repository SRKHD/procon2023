import 'package:flutter/material.dart';

class WeightLiteItem extends StatelessWidget {
  const WeightLiteItem({
    super.key,
    required this.useId,
    required this.value,
  });

  final String useId;
  final double value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(value.toString()),
    );
  }
}
