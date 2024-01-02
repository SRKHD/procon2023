import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../theme/sizes.dart';
import 'delete_button.dart';

class EditableCard extends ConsumerWidget {
  const EditableCard({
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.onPressedDelete,
    super.key,
  });

  final String title;
  final String subtitle;

  /// コールバック
  final VoidCallback onPressed;

  /// コールバック 削除
  final VoidCallback onPressedDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ステータス表示エリア
    final statusLabel = Container(
      width: RawSize.p60,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(RawSize.p8),
      color: BrandColor.moriGreen,
      //child: StatusImage(status: memo.status),
    );

    /// 文字を表示するエリア
    final textArea = Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: BrandText.bodyL,
            maxLines: 1,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.right,
            style: BrandText.bodyS,
            maxLines: 1,
          ),
        ],
      ),
    );

    /// ボタンを並べるエリア
    final actionsRow = Container(
      width: RawSize.p60,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(RawSize.p8),
      child: Row(
        children: [
          const Spacer(),
          DeleteButton(onPressed: onPressedDelete),
        ],
      ),
    );

    /// レイアウト
    final layouts = SizedBox(
      height: RawSize.p90,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          statusLabel,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(RawSize.p4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: textArea),
                ],
              ),
            ),
          ),
          actionsRow,
        ],
      ),
    );

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: layouts,
      ),
    );
  }
}
