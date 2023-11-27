import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            textAlign: TextAlign.right,
            decoration: const InputDecoration(hintText: '体重を入力'),
            // keyboardType: TextInputType.number,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^[1-9]+[0-9]*(\.([1-9]*|[0-9]+[1-9]+))?$'))
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('登録'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
