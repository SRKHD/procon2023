import 'dart:async';

import 'package:bodquest_2023/infrastructure/model/firestore/training/fug_training_kind.dart';
import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

import '../../../core/util/datetime_utils.dart';
import '../../model/firestore/training/fug_get_trainings_response.dart';
import '../../model/firestore/training/fug_training.dart';
import 'ios_healthia_training_datasource.dart';

class IOSHealthiaTrainingDatasourceImpl
    implements IiOSHealthiaTrainingDatasource {
  // アプリで使用するHealthFactoryを作成する
  HealthFactory health = HealthFactory();
  List<HealthDataPoint> _healthDataList = [];
  List<FugTraining> _items = [];

  void addItems(
      String userId, FugTrainingKind kind, Map<DateTime, int> values) {
    values.forEach((key, value) {
      _items.add(FugTraining(
        userId: userId,
        kind: kind,
        date: key,
        timestamp: 0,
        value: value,
      ));
    });
  }

  @override
  Stream<FugGetTrainingsResponse> getTrainings(String userId) {
    // 取得する型を定義する
    final types = [
      HealthDataType.STEPS,
      // HealthDataType.WEIGHT,
      // HealthDataType.HEIGHT,
      // HealthDataType.BLOOD_GLUCOSE,
      // // iOSではこの行をコメント解除してください - iOSでのみ利用可能
      HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    // パーミッション対応
    final permissions = [
      HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // // typesの要素数と合わせる必要があるため、1つ追加
      HealthDataAccess.READ,
    ];

    // 過去24時間以内のデータを取得する
    final now = DateTime.now();
    //final prevDays = getPrevMonth(now);
    final prevDays = getPreWeek(now);

    final controller = StreamController<FugGetTrainingsResponse>();

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

            final Map<DateTime, int> walkMap = {};
            final Map<DateTime, int> runMap = {};
            for (var x in _healthDataList) {
              final day = getDayOnly(x.dateFrom);
              if (x.type == HealthDataType.STEPS) {
                double value = double.parse(x.value.toString());
                if (walkMap.containsKey(day)) {
                  value += walkMap[day]!;
                }
                walkMap[day] = value.toInt();
              } else {
                double value = double.parse(x.value.toString());
                if (runMap.containsKey(day)) {
                  value += runMap[day]!;
                }
                runMap[day] = value.toInt();
              }
              if (kDebugMode) {
                print(x);
              }
            }
            addItems(userId, FugTrainingKind.walk, walkMap);
            addItems(userId, FugTrainingKind.run, runMap);
            controller.add(FugGetTrainingsResponse(results: _items));
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
