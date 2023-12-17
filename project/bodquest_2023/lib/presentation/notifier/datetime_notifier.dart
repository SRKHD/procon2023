import 'package:riverpod_annotation/riverpod_annotation.dart';

/* ここはファイル名と合わせること! */
part 'datetime_notifier.g.dart';

/*
  保存 > generatorコマンド を忘れないでね！

  flutter pub run build_runner build --delete-conflicting-outputs
*/

/// -----------------------------------------------------------
/// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
/// -----------------------------------------------------------
@riverpod
class DateTimeNotifier extends _$DateTimeNotifier {
  @override
  DateTime build() {
    return DateTime.now();
  }

  // 新しい文字データを保存する
  void update(DateTime newDateTime) {
    state = newDateTime;
  }
}
