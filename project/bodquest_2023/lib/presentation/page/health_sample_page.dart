// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

import '../theme/colors.dart';

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_NOT_ADDED,
  STEPS_READY,
}

class HealthSamplePage extends StatefulWidget {
  HealthSamplePage({super.key});

  @override
  State<HealthSamplePage> createState() => _HealthAppState();
}

class _HealthAppState extends State<HealthSamplePage> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  int _nofSteps = 10;
  double _mgdl = 10.0;

  // アプリで使用するHealthFactoryを作成する
  HealthFactory health = HealthFactory();

  /// healthプラグインからデータポイントを取得し、アプリに表示する
  Future fetchData() async {
    setState(() => _state = AppState.FETCHING_DATA);

    // 取得する型を定義する
    final types = [
      HealthDataType.STEPS,
      HealthDataType.WEIGHT,
      HealthDataType.HEIGHT,
      HealthDataType.BLOOD_GLUCOSE,
      // iOSではこの行をコメント解除してください - iOSでのみ利用可能
      HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    // パーミッション対応
    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      // typesの要素数と合わせる必要があるため、1つ追加
      HealthDataAccess.READ,
    ];

    // 過去24時間以内のデータを取得する
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    // データ型へのアクセスを要求する
    // READアクセスのみ必要なので、厳密にはpermissionsは必要ない
    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      try {
        // ヘルスデータを取得する
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(yesterday, now, types);

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
      setState(() {
        _state =
            _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      });
    } else {
      if (kDebugMode) {
        print("認証でNG");
      }
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  /// ランダムなhealthデータを追加する
  Future addData() async {
    final now = DateTime.now();
    final earlier = now.subtract(const Duration(minutes: 5));

    _nofSteps = Random().nextInt(10);
    final types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
    final rights = [HealthDataAccess.WRITE, HealthDataAccess.WRITE];
    final permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    // bool? hasPermissions =
    //     await HealthFactory.hasPermissions(types, permissions: rights);
    bool? hasPermissions =
        await health.hasPermissions(types, permissions: rights);
    if (hasPermissions == false) {
      await health.requestAuthorization(types, permissions: permissions);
    }

    _mgdl = Random().nextInt(10) * 1.0;
    bool success = await health.writeHealthData(
        _nofSteps.toDouble(), HealthDataType.STEPS, earlier, now);

    if (success) {
      success = await health.writeHealthData(
          _mgdl, HealthDataType.BLOOD_GLUCOSE, now, now);
    }

    setState(() {
      _state = success ? AppState.DATA_ADDED : AppState.DATA_NOT_ADDED;
    });
  }

  /// ヘルスプラグインから歩数を取得し、アプリに表示する
  Future fetchStepData() async {
    int? steps;

    // 本日(要するに午前0時から)の歩数を取得する
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        if (kDebugMode) {
          print("Caught exception in getTotalStepsInInterval: $error");
        }
      }

      if (kDebugMode) {
        print('Total number of steps: $steps');
      }

      setState(() {
        _nofSteps = (steps == null) ? 0 : steps;
        _state = (steps == null) ? AppState.NO_DATA : AppState.STEPS_READY;
      });
    } else {
      if (kDebugMode) {
        print("Authorization not granted");
      }
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(20),
            child: const CircularProgressIndicator(
              strokeWidth: 10,
            )),
        const Text('データ取得中...')
      ],
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString} '),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return const Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('ダウンロードボタンを押すと、データを取得する'),
        Text('プラスボタンを押すと、ランダムなヘルスデータを追加する'),
        Text('ウォーキングボタンを押すと、合計歩数を取得する'),
      ],
    );
  }

  Widget _authorizationNotGranted() {
    return const Text('権限が与えられていない'
        'Androidの場合は、Google Developer ConsoleでOAUTH2クライアントIDが正しいかどうか確認してください'
        'iOSの場合は、Apple Healthのアクセス権を確認してください');
  }

  Widget _dataAdded() {
    return Text('$_nofSteps 歩、$_mgdl mgdlは正常に挿入された');
  }

  Widget _stepsFetched() {
    return Text('合計歩数: $_nofSteps');
  }

  Widget _dataNotAdded() {
    return const Text('データの追加に失敗');
  }

  Widget _content() {
    switch (_state) {
      case AppState.DATA_READY:
        return _contentDataReady();
      case AppState.NO_DATA:
        return _contentNoData();
      case AppState.FETCHING_DATA:
        return _contentFetchingData();
      case AppState.AUTH_NOT_GRANTED:
        return _authorizationNotGranted();
      case AppState.DATA_ADDED:
        return _dataAdded();
      case AppState.STEPS_READY:
        return _stepsFetched();
      case AppState.DATA_NOT_ADDED:
        return _dataNotAdded();
      default:
        break;
    }

    return _contentNotFetched();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColor.moriGreen,
            title: const Text('Health Example'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.file_download),
                onPressed: () {
                  fetchData();
                },
              ),
              IconButton(
                onPressed: () {
                  addData();
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  fetchStepData();
                },
                icon: const Icon(Icons.nordic_walking),
              )
            ],
          ),
          body: Center(
            child: _content(),
          )),
    );
  }
}
