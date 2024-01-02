import 'package:flutter/material.dart';

import '../control/editable_card.dart';

class WeightListCard extends StatelessWidget {
  const WeightListCard({
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
    return EditableCard(
      title: _date,
      subtitle: '$_value Kg',
      onPressed: () => {},
      onPressedDelete: () => {},
    );
  }
}
