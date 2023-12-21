import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/text_notifier.dart';

class NumberTextField extends ConsumerWidget {
  const NumberTextField({
    super.key,
    required this.controller,
    required this.notifier,
    required this.labelText,
    required this.hintText,
  });

  final String labelText;
  final String hintText;
  // 入力コントローラーを外から渡してもらう
  final TextEditingController controller;
  final TextNotifier notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(30),
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        errorText: "",
      ),
      maxLines: 1,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp(r'^[1-9]+[0-9]*(\.([1-9]*|[0-9]+[1-9]+))?$'))
      ],
      onChanged: (value) {
        notifier.save(value);
      },
    );
  }
}
