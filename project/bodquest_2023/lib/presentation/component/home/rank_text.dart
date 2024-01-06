import 'package:flutter/material.dart';

import '../../../domain/value/evaluation_rank.dart';

class RankText extends StatelessWidget {
  const RankText({super.key, required this.rank});

  /// ステータス
  final EvaluationRank rank;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Rank:'), Text(rank.stringValue)],
    );
  }
}
