import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/value/evaluation_rank.dart';
import '../component/control/item_evaluation_panel.dart';
import '../component/home/chara_image.dart';
import '../component/home/level_text.dart';
import '../component/home/pace_text.dart';
import '../component/home/rank_text.dart';
import '../notifier/evaluation/evaluation_provider.dart';
import '../router/go_router.dart';
import '../router/page_path.dart';
import '../theme/sizes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluationState = ref.watch(evaluationNotifierProvider);
    final tempRank = EvaluationRank.from(evaluationState.rank);
    const tempWeight = 67.5;
    const tempLevel = 17;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RankText(
          rank: tempRank,
        ),
        PaceText(
          expectedWeight: tempWeight,
        ),
        ItemEvaluationPanel(
          title: '体重',
          onPressed: () {
            final router = ref.read(goRouterProvider);
            router.pushNamed(
              PageId.weightlist.routeName,
            );
          },
          percentBarGraphWidth: RawSize.p200,
          percentBarGraphHeight: RawSize.p32,
          percentBarGraphValue: evaluationState.weightScore,
        ),
        ItemEvaluationPanel(
          title: '運動',
          onPressed: () {
            final router = ref.read(goRouterProvider);
            router.pushNamed(
              PageId.traininglist.routeName,
            );
          },
          percentBarGraphWidth: RawSize.p200,
          percentBarGraphHeight: RawSize.p32,
          percentBarGraphValue: evaluationState.exerciseScore,
        ),
        ItemEvaluationPanel(
          title: '食事',
          onPressed: () {},
          percentBarGraphWidth: RawSize.p200,
          percentBarGraphHeight: RawSize.p32,
          percentBarGraphValue: 90,
        ),
        LevelText(
          level: tempLevel,
        ),
        CharaImage(rank: tempRank)
      ],
    );
  }
}
