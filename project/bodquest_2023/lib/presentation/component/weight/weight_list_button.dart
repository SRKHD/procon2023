import 'package:flutter/material.dart';

import '../../theme/fonts.dart';
import '../../theme/sizes.dart';
import '../control/gap.dart';

class WeightListButton extends StatelessWidget {
  const WeightListButton({
    super.key,
    required this.onPressed,
  });

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    /// アイコン
    const icon = Icon(Icons.list);

    /// 文字
    const text = Text(
      '',
      style: BrandText.bodyL,
    );

    /// レイアウト
    return FloatingActionButton.extended(
      heroTag: null,
      //backgroundColor: BrandColor.bananaYellow,
      onPressed: onPressed,
      label: Row(
        children: [
          icon,
          Gap.w(RawSize.p8),
          text,
        ],
      ),
    );
  }
}
