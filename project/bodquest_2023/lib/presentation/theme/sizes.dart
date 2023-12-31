import 'package:flutter/foundation.dart';

/// 値の意味を含まないサイズ一覧定義
class RawSize {
  static const p1 = 1.0;
  static const p4 = 4.0;
  static const p8 = 8.0;

  static const p12 = 12.0;
  static const p14 = 14.0;
  static const p16 = 16.0;
  static const p18 = 18.0;
  static const p20 = 20.0;
  static const p22 = 22.0;
  static const p24 = 24.0;

  static const p28 = 28.0;
  static const p32 = 32.0;

  static const p40 = 40.0;
  static const p60 = 60.0;
  static const p90 = 90.0;
  static const p120 = 120.0;
  static const p150 = 150.0;
  static const p200 = 200.0;
  static const p250 = 250.0;
  static const p300 = 300.0;
  static const p400 = 300.0;
  static const p600 = 300.0;
}

/// 設計画面サイズ
class DesignSize {
  const DesignSize._({
    required this.tabBarH,
    required this.overflowH,
    required this.dividerW,
    required this.padding,
    required this.arrowW,
    required this.fontSize,
    required this.fontBorderW,
    required this.fontSpacing,
    required this.shadowH,
    required this.iconH,
    required this.highlightW,
  });

  static const double aspectRatio = kIsWeb ? 10.0 / 16.0 : 1.0;

  final double tabBarH; // タブバーの高さ
  final double overflowH; // アイコンが上にはみ出す高さ
  final double dividerW; // 区切り線の幅
  final double padding; // アイコンの周りの余白
  final double arrowW; // 矢印の幅
  final double fontSize; // フォントの大きさ
  final double fontBorderW; // フォントのボーダーの幅
  final double fontSpacing; // フォントの間隔
  final double shadowH; // 影の高さ
  final double iconH; // アイコンの高さ
  final double highlightW; // ハイライトの幅

  static const expectedW = 1200.0;

  factory DesignSize(double actualW) {
    final r = (actualW / expectedW);
    const tabCount = 6;
    // タブ数5で調整されている
    const adjustedRatio = kIsWeb ? 0.95 : 1.0;
    final baseTabWidth = 400 * r * aspectRatio * adjustedRatio;
    //print('baseTabWidth $baseTabWidth');
    final tabWidth = baseTabWidth * (5 / tabCount);
    //print('tabwidth $tabWidth');

    const adjustFontRation = kIsWeb ? 0.5 : 1.0;

    return DesignSize._(
      tabBarH: r * 200.0,
      overflowH: r * 25.0,
      dividerW: r * 4.0,
      padding: r * 15.0,
      arrowW: r * 40.0,
      fontSize: r * 32.0 * adjustFontRation,
      fontBorderW: r * 6.0,
      fontSpacing: r * 2.0,
      iconH: r * 170.0,
      highlightW: tabWidth, //r * tabWidth,
      shadowH: r * 18.0,
    );
  }
}
