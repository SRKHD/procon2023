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
                // todo：ログイン画面
                
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