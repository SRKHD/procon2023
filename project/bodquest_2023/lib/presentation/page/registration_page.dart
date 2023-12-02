import 'package:flutter/material.dart';

// アカウント登録ページ
class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                  Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
                  child:Text('新規アカウントの作成',
                    style: TextStyle(fontSize: 20))
                ),
              ],
            ),
        ),
    );
  }
}