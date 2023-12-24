import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain_module.dart';
import '../../../domain/usecase/evaluation/get_activity_evaluation_usecase.dart';
import '../../../domain/usecase/user/get_login_user_usecase.dart';
import '../../state/evaluation/evaluation_state.dart';

final evaluationNotifierProvider =
    StateNotifierProvider<EvaluationNotifier, EvaluationState>(
  (ref) => EvaluationNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getEvaluationUsecase: ref.read(getActivityEvaluationUsecase),
  ),
);

class EvaluationNotifier extends StateNotifier<EvaluationState> {
  EvaluationNotifier({
    required IGetLogInUserUsecase getLogInUserUsecase,
    required IGetActivityEvaluationUsecase getEvaluationUsecase,
  })  : _getLogInUserUsecase = getLogInUserUsecase,
        _getEvaluationUsecase = getEvaluationUsecase,
        super(EvaluationState(rank: '', score: 0)) {
    _getLogInUserUsecase.execute().then((value) => _fetch(value.id));
  }

  final IGetLogInUserUsecase _getLogInUserUsecase;
  final IGetActivityEvaluationUsecase _getEvaluationUsecase;

  Future<void> _fetch(String userId) async {
    final rank = await _getEvaluationUsecase.getRank(userId);
    final score = await _getEvaluationUsecase.getScore(userId);
    state = EvaluationState(rank: rank.name, score: score);
    //state = _getEvaluationUsecase.execute();
  }
}
