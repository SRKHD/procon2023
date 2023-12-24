import 'package:bodquest_2023/domain/entity/training.dart';

import '../../../usecase/training/get_calories_consumed_usecase.dart';

class GetCaloriesConsumedUsecaseImpl implements IGetCaloriesConsumedUsecase {
  @override
  int get(Training target) {
    // TODO: implement get
    return 300;
  }
}
