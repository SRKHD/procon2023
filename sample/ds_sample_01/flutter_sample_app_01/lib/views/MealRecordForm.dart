import 'package:flutter/material.dart';

class MealRecordForm extends StatelessWidget {
  String _memo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('食事記録フォーム'), backgroundColor: Colors.orangeAccent),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'メモ',
                ),
                onChanged: (value) {
                  _memo = value;
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('登録'),
              onPressed: () {
                Navigator.of(context).pop(_memo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
