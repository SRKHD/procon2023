import 'package:flutter/material.dart';

class WeightLiteItem extends StatelessWidget {
  const WeightLiteItem({
    super.key,
    required String userId,
    required String date,
    required double value,
  })  : _date = date,
        _value = value;

  final String _date;
  final double _value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$_date $_value Kg'),
    );
  }
}
