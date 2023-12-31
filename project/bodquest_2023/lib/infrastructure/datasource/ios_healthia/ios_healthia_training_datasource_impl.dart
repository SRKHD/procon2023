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
    print('-----01');
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

    print('-----02');
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

            print('-----03');
            // 重複データは除外する
            _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

            print('-----03-01');
            final Map<DateTime, int> walkMap = {};
            final Map<DateTime, int> runMap = {};
            for (var x in _healthDataList) {
              print('-----03-02');
              final day = getDayOnly(x.dateFrom);
              print('-----03-02-2 $day');
              if (x.type == HealthDataType.STEPS) {
                print('-----03-03 $x');
                final n = x.value;
                print('-----03-03-2 $n');
                double value = double.parse(x.value.toString());
                print('-----03-04');
                if (walkMap.containsKey(day)) {
                  value += walkMap[day]!;
                }
                walkMap[day] = value.toInt();
              } else {
                print('-----03-05 $x');
                final n = x.value;
                print('-----03-05-2 $n');
                double value = double.parse(x.value.toString());
                print('-----03-06');
                if (runMap.containsKey(day)) {
                  value += runMap[day]!;
                }
                runMap[day] = value.toInt();
              }
              if (kDebugMode) {
                print(x);
              }
            }
            int length = runMap.length;
            print('-----04 $length');
            int length2 = walkMap.length;
            print('-----04-2 $length2');
            addItems(userId, FugTrainingKind.walk, walkMap);
            print('-----05');
            addItems(userId, FugTrainingKind.run, runMap);
            print('-----06');
            // for (var x in _healthDataList) {
            //   final kind = x.type == HealthDataType.STEPS
            //       ? FugTrainingKind.walk
            //       : FugTrainingKind.run;
            //   _items.add(FugTraining(
            //     userId: userId,
            //     kind: kind,
            //     date: x.dateFrom,
            //     timestamp: 0,
            //     value: int.parse(x.value.toString()),
            //   ));
            // }
            int length3 = _items.length;
            print('-----07 $length3');
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
