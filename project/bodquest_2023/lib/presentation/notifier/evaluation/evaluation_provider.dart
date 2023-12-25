import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/evaluation/evaluation_state.dart';
import '../../usecaese_provider_module.dart';
import 'evaluation_notifier.dart';

final evaluationNotifierProvider =
    StateNotifierProvider<EvaluationNotifier, EvaluationState>(
  (ref) => EvaluationNotifier(
    getLogInUserUsecase: ref.read(getLogInUserUsecaseProvider),
    getEvaluationUsecase: ref.read(getActivityEvaluationUsecase),
  ),
);
