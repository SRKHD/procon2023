import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

import '../../../../core/util/datetime_utils.dart';
import '../../../model/firestore/weight/fug_get_weights_response.dart';
import '../../../model/firestore/weight/fug_weight.dart';
import '../../interface/ios_healthia/ios_healthia_weight_datasource.dart';

class IOSHealthiaWeightDatasourceImpl implements IiOSHealthiaWeightDatasource {
  // アプリで使用するHealthFactoryを作成する
  HealthFactory health = HealthFactory();
  List<HealthDataPoint> _healthDataList = [];

  @override
  Stream<FugGetWeightsResponse> getWeights(String userId) {
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
    //final prevDays = getPrevMonth(now);
    final prevDays = getPreWeek(now);

    final controller = StreamController<FugGetWeightsResponse>();
    List<FugWeight> items = [];

    // データ型へのアクセスを要求する
    // READアクセスのみ必要なので、厳密にはpermissionsは必要ない
    health.requestAuthorization(types, permissions: permissions).then((value) {
      if (value) {
        try {
          // ヘルスデータを取得する
          health
              .getHealthDataFromTypes(prevDays, now, types)
              .then((healthData) {
            //
            // 新しいデータポイントをすべて保存する（最初の100件のみ）
            _healthDataList.addAll((healthData.length < 100)
                ? healthData
                : healthData.sublist(0, 100));

            // 重複データは除外する
            _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

            // 結果をスナップ出力する
            for (var x in _healthDataList) {
              items.add(FugWeight(
                id: '', // 自動生成されるので不要
                userId: userId,
                date: x.dateFrom,
                timestamp: 0,
                value: double.parse(x.value.toString()),
              ));
              if (kDebugMode) {
                print(x);
              }
            }
            controller.add(FugGetWeightsResponse(results: items));
            return controller.stream;
          });
        } catch (error) {
          if (kDebugMode) {
            print("Exception in getHealthDataFromTypes: $error");
          }
        }
      } else {
        if (kDebugMode) {
          print("認証でNG");
        }
      }
    });

    return controller.stream;
  }
}
