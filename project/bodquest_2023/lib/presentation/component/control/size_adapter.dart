import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../theme/sizes.dart';

/// サイズ調整
/// ブラウザ：スマホと同じ比率で表示
/// スマホ：上下に空白を入れる
class SizeAdapter extends StatelessWidget {
  const SizeAdapter({
    super.key,
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
/*     if (kIsWeb) {
      return Scaffold(
        backgroundColor: Colors.grey,
        body:
            child /* Center(
          child: AspectRatio(
            // aspectRatio: 9.0 / 16.0,
            aspectRatio: DesignSize.aspectRatio,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: child,
            ),
          ),
        ) */
        ,
      );
    } */
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: child,
        ));
  }
}
