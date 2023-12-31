import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

import '../../../core/util/datetime_utils.dart';
import '../../model/firestore/training/fug_get_trainings_response.dart';
import '../../model/firestore/training/fug_training.dart';
import '../../model/firestore/weight/fug_get_weights_response.dart';
import 'ios_healthia_weight_datasource.dart';

class IOSHealthiaWeightDatasourceImpl implements IiOSHealthiaWeightDatasource {
  // アプリで使用するHealthFactoryを作成する
  HealthFactory health = HealthFactory();
  List<HealthDataPoint> _healthDataList = [];

  @override
  Future<FugGetWeightsResponse> getWeights(String userId) async {
    // 取得する型を定義する
    final types = [
      // HealthDataType.STEPS,
      HealthDataType.WEIGHT,
      // HealthDataType.HEIGHT,
      // HealthDataType.BLOOD_GLUCOSE,
      // // iOSではこの行をコメント解除してください - iOSでのみ利用可能
      // HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    // パーミッション対応
    final permissions = [
      // HealthDataAccess.READ,
      HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // // typesの要素数と合わせる必要があるため、1つ追加
      // HealthDataAccess.READ,
    ];

    // 過去24時間以内のデータを取得する
    final now = DateTime.now();
    // final prevMonth = getPrevMonth(now);
    final prevMonth = now.subtract(const Duration(days: 1));

    // データ型へのアクセスを要求する
    // READアクセスのみ必要なので、厳密にはpermissionsは必要ない
    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    List<FugTraining> items = [];
    if (requested) {
      try {
        // ヘルスデータを取得する
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(prevMonth, now, types);

        // 新しいデータポイントをすべて保存する（最初の100件のみ）
        _healthDataList.addAll((healthData.length < 100)
            ? healthData
            : healthData.sublist(0, 100));
      } catch (error) {
        if (kDebugMode) {
          print("Exception in getHealthDataFromTypes: $error");
        }
      }

      // 重複データは除外する
      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      // 結果をスナップ出力する
      for (var x in _healthDataList) {
        if (kDebugMode) {
          print(x);
        }
      }

      // 結果を表示するために、UIを更新する
      // setState(() {
      //   _state =
      //       _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      // });
      //final result = FugGetTrainingsResponse(results: items);
      //return Future(result.);
    } else {
      if (kDebugMode) {
        print("認証でNG");
      }
      // setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
    return Future.value(FugGetTrainingsResponse(results: items));
  }
}
