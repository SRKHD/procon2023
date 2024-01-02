import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../theme/sizes.dart';
import 'delete_button.dart';

class EditableCard extends ConsumerWidget {
  const EditableCard({
    required this.userId,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.onPressedDelete,
    super.key,
  });

  final String userId;
  final String id;
  final String title;
  final String subtitle;

  /// コールバック カード選択
  final Function(String, String) onPressed;

  /// コールバック 削除
  final Function(String, String) onPressedDelete;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: BrandText.bodyL,
            maxLines: 1,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.left,
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
          DeleteButton(onPressed: () => onPressedDelete(userId, id)),
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
        onTap: () => onPressed(userId, id),
        child: layouts,
      ),
    );
  }
}
