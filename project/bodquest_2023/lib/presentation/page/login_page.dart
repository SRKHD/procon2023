import 'package:bodquest_2023/main.dart';
import 'package:bodquest_2023/presentation/page/registration_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {

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
                      //todo
                    },
                  )
                ),

                // パスワードの入力フォーム
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 20.0),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "パスワード（8～20文字）"
                    ),
                    onChanged: (String value) {
                      // todo
                    },
                  ),
                ),
                
                // ログイン失敗時のエラーメッセージ
                // todo

                // ログインボタン
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 50),
                  child: ElevatedButton(
                    child: const Text('ログイン'),
                  onPressed: (){
                    // todo
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