import 'package:bodquest_2023/core/exception/firebasse_auth_exception.dart';
import 'package:bodquest_2023/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// アカウント登録ページ
class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String _email = "";
  String _password = "";
  String _infoText = ""; // 登録に関する情報を表示
  late bool _validPassword; // パスワードが有効な文字数を満たしているかどうか

  // Firebase Authenticationを利用するためのインスタンス
  final FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential _result;
  late User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
                child: Text('新規アカウントの作成',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

            // メールアドレスの入力フォーム
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "メールアドレス"),
                  onChanged: (String value) {
                    _email = value;
                  },
                )),

            // パスワードの入力フォーム
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "パスワード（8～20文字）"),
                obscureText: true, // パスワードが見えないようにする
                maxLength: 20, // 入力可能な文字数
                maxLengthEnforcement: MaxLengthEnforcement.enforced, // 入力可能な文字数の制限を超える場合の挙動の制御
                onChanged: (String value) {
                  if (value.length >= 8) {
                    _password = value;
                    _validPassword = true;
                  } else {
                    _validPassword = false;
                  }
                },
              ),
            ),

            // 登録失敗時のエラーメッセージ
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(_infoText,style: TextStyle(color: Colors.red)),
            ),

            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: ElevatedButton(
                child: Text('登録', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () async {
                  if (_validPassword) {
                    try {
                      // メール/パスワードでユーザー登録
                      _result = await auth.createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );

                      // 登録成功
                      // ホーム画面へ遷移
                      _user = _result.user!;
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                  title: 'Flutter Demo Home Page'),
                            ));
                      }
                    } on FirebaseAuthException catch (e) {
                      // 登録に失敗した場合
                      setState(() {
                        _infoText = AuthException(e.code).toString();
                      });
                    }
                  } else {
                    setState(() {
                      _infoText = 'パスワードは8文字以上です。';
                    });
                  }
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
              child: ElevatedButton(
                  child: const Text('ログイン画面に戻る'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
