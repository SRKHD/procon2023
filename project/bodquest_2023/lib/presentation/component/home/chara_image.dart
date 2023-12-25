import 'package:bodquest_2023/domain/value/evaluation_rank.dart';
import 'package:flutter/material.dart';

import '../../theme/images.dart';

class CharaImage extends StatelessWidget {
  const CharaImage({super.key, required this.rank});

  /// ステータス
  final EvaluationRank rank;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 250,
      height: 250,
      child: Image.asset(
        fit: BoxFit.cover,
        switch (rank) {
          EvaluationRank.g => RankImage.rankG.path,
          EvaluationRank.f => RankImage.rankF.path,
          EvaluationRank.e => RankImage.rankE.path,
          EvaluationRank.d => RankImage.rankD.path,
          EvaluationRank.c => RankImage.rankC.path,
          EvaluationRank.b => RankImage.rankB.path,
          EvaluationRank.a => RankImage.rankA.path,
          EvaluationRank.s => RankImage.rankS.path,
          EvaluationRank.unknown => RankImage.rankUnknown.path,
        },
      ),
    ));
  }
}
