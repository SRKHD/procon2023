import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/value/evaluation_rank.dart';

part 'evaluation_rank_notifier.g.dart';

@riverpod
class EvaluationRankNotifier extends _$EvaluationRankNotifier {
  @override
  EvaluationRank build() {
    return EvaluationRank.g;
  }

  void update(String value) {
    state = EvaluationRank.from(value);
  }
}
