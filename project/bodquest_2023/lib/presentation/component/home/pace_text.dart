import 'package:flutter/material.dart';

import '../../theme/sizes.dart';

class PaceText extends StatelessWidget {
  const PaceText({super.key, required this.expectedWeight});
  final double expectedWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('30日後の予想体重'),
        Text(
          '${expectedWeight.toStringAsFixed(2)} kg',
          style: TextStyle(fontSize: RawSize.p60),
        ),
      ],
    );
  }
}
