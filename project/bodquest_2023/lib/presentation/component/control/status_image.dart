import 'package:flutter/material.dart';

/// ステータス画像
class StatusImage extends StatelessWidget {
  const StatusImage({
    super.key,
    required this.path,
  });

  /// ステータス
  final String path;

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) return SizedBox();

    return Image.asset(path);
  }
}
