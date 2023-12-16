import 'package:riverpod_annotation/riverpod_annotation.dart';

/* ここはファイル名と合わせること! */
part 'text_notifier.g.dart';

/*
  保存 > generatorコマンド を忘れないでね！

  flutter pub run build_runner build --delete-conflicting-outputs
*/

/// -----------------------------------------------------------
/// ノティファイヤー & 自動で作られるプロバイダー - 文字を保存しておく
/// -----------------------------------------------------------
@riverpod
class TextNotifier extends _$TextNotifier {
  @override
  String build() {
    return '';
  }

  // 新しい文字データを保存する
  void save(String newText) {
    state = newText;
  }
}
