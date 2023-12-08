import 'package:flutter/material.dart';

class WeightLiteItem extends StatelessWidget {
  const WeightLiteItem({
    Key? key,
    required this.useId,
    required this.value,
  }) : super(key: key);

  final String useId;
  final double value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(value.toString()),
    );
  }
}
