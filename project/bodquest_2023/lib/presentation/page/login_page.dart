// ignore_for_file: unused_field

import 'package:bodquest_2023/core/exception/firebasse_auth_exception.dart';
import 'package:bodquest_2023/main.dart';
import 'package:bodquest_2023/presentation/page/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {
  String _email = "";
  String _password = "";
  String _infoText = ""; 

  late UserCredential _result;
  late User _user;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                // メールアドレスの入力フォーム
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "メールアドレス"
                    ),
                    onChanged: (String value) {
                      _email = value;
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
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,// 入力可能な文字数の制限を超える場合の挙動の制御
                    onChanged: (String value) {
                      _password = value;
                    },
                  ),
                ),
                
                // ログイン失敗時のエラーメッセージ
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                  child:Text(_infoText,
                    style: TextStyle(color: Colors.red),),
                ),

                // ログインボタン
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 50),
                  child: ElevatedButton(
                    child: const Text('ログイン'),
                  onPressed: () async{
                    try{
                      // ログイン
                      _result = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email,
                        password: _password);
                        
                      // ログイン成功
                      // ホーム画面に遷移
                      _user = _result.user!;
                      if (context.mounted) {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
                        )
                      );
                      }
                    }
                    on FirebaseAuthException catch (e)
                    {
                      // ログインに失敗した場合
                      setState(() {
                        _infoText = AuthException(e.code).toString();
                      });
                    }
                  }),
                ),
                                      
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  // アカウント作成ボタン
                  child:ElevatedButton(
                  child: const Text('アカウントを作成する'),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => RegistrationPage(),
                      ),
                    );
                    }),
                  ),

                  // 開発用
                  Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
                  child:ElevatedButton(
                  child: const Text('開発用：ログインスキップ'),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => const MyHomePage(title: 'Flutter Demo Home Page'),
                      ),
                    );
                  }),
                  )
                  
              ],
            ),
        ),
    );
 }
} 