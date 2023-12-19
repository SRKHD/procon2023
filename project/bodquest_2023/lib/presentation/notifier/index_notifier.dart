import 'package:riverpod_annotation/riverpod_annotation.dart';

/* ここはファイル名と合わせること! */
part 'index_notifier.g.dart';

/*
  保存 > generatorコマンド を忘れないでね！

  flutter pub run build_runner build --delete-conflicting-outputs
*/

/// -----------------------------------------------------------
/// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
/// -----------------------------------------------------------
@riverpod
class IndexNotifier extends _$IndexNotifier {
  @override
  int build() {
    return 0;
  }

  // データを保存する
  void save(int value) {
    state = value;
  }
}
