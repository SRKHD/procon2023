import 'package:flutter/material.dart';

import '../component_types.dart';

class TrainingLiteItem extends StatelessWidget {
  const TrainingLiteItem({
    super.key,
    required String kind,
    required int value,
    required String date,
  })  : _value = value,
        _date = date,
        _kind = kind;

  final String _kind;
  final String _date;
  final int _value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        switch (TrainingKind.from(_kind)) {
          TrainingKind.walk => 'ウォーキング',
          TrainingKind.run => 'ランニング',
          TrainingKind.workOut => '筋トレ',
        },
      ),
      subtitle: Text(
        switch (TrainingKind.from(_kind)) {
          TrainingKind.walk => '$_date　　　$_value 歩',
          TrainingKind.run => '$_date　　　$_value m',
          TrainingKind.workOut => '$_date　　　$_value 分',
        },
      ),
    );
  }
}
