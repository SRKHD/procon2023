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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ),

                // メールアドレスの入力フォーム
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  child:TextFormField(
                    decoration: InputDecoration(labelText: "メールアドレス"),
                    onChanged: (String value) {
                      // todo
                    },
                  )
                ),

                // パスワードの入力フォーム
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "パスワード（8～20文字）"
                    ),
                    obscureText: true,  // パスワードが見えないようにする
                    maxLength: 20,  // 入力可能な文字数
                  ),
                ),

                // 登録失敗時のエラーメッセージ
                 // todo
                   
                ButtonTheme(
                  minWidth: 350.0,
                  // height: 100.0,
                  child:ElevatedButton(
                    child: Text('登録',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: (){
                      // todo
                    }
                  ),
                ),
              ],
            ),
        ),
    );
  }
}