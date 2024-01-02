import 'package:flutter/material.dart';

/// 削除ボタン
class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.onPressed,
  });

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.delete),
        // child: Text(
        //   L10n.delete,
        //   style: BrandText.bodyS.copyWith(
        //     color: BrandColor.dangerRed,
        //   ),
        // ),
      ),
    );
  }
}
