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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const userId = 'srkhd.2023@gmail.com';
    String inputValue = '0';
    final editingController = TextEditingController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              alignment: Alignment.topCenter,
              child: StreamBuilder<QuerySnapshot>(
                //2
                stream: FirebaseFirestore.instance
                    .collection('weight')
                    .where('id', isEqualTo: userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('エラーが発生しました');
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final list = snapshot.requireData.docs
                      .map<String>((DocumentSnapshot document) {
                    return document['value'].toString();
                  }).toList();

                  final reverseList = list.reversed.toList();

                  return ListView.builder(
                    itemCount: reverseList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Text(
                          reverseList[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          TextField(
            textAlign: TextAlign.right,
            decoration: const InputDecoration(hintText: '体重を入力'),
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^[1-9]+[0-9]*(\.([1-9]*|[0-9]+[1-9]+))?$'))
            ],
            controller: editingController,
            onChanged: (value) {
              inputValue = value;
            },
          ),
          ElevatedButton.icon(
            onPressed: () async {
              // ドキュメント作成
              await FirebaseFirestore.instance
                  .collection('weight') // コレクションID
                  .doc() // ドキュメントID
                  .set(
                      {'value': double.parse(inputValue), 'id': userId}); // データ
              editingController.text = '';
            },
            label: Text('登録'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
