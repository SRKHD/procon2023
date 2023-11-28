import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  final TextEditingController _controller = TextEditingController();

  final _list = List.generate(10, (index) => 'test $index');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reverseList = _list.reversed.toList();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              alignment: Alignment.topCenter,
              child: ListView.builder(
                itemCount: reverseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text(
                      reverseList[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
          ),
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
