// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:go_router/go_router.dart';

import '../../core/exception/firebasse_auth_exception.dart';
import '../provider/user/user_list_provider.dart';

class LogInPage extends ConsumerStatefulWidget {
  @override
  LogInPageState createState() => LogInPageState();
}

class LogInPageState extends ConsumerState<LogInPage> {
  String _email = "";
  String _password = "";
  String _infoText = "";

  late UserCredential _result;
  late User _user;
  late bool _isSigningIn;

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
                maxLengthEnforcement:
                    MaxLengthEnforcement.enforced, // 入力可能な文字数の制限を超える場合の挙動の制御
                onChanged: (String value) {
                  _password = value;
                },
              ),
            ),

            // ログイン失敗時のエラーメッセージ
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
              child: Text(
                _infoText,
                style: TextStyle(color: Colors.red),
              ),
            ),

            // ログインボタン
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 25.0),
              child: ElevatedButton(
                  child: const Text('ログイン'),
                  onPressed: () async {
                    try {
                      // ログイン
                      _result = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);

                      // ログイン成功
                      // ホーム画面に遷移
                      _user = _result.user!;
                      if (context.mounted) {
                        context.go('/main');
                      }
                    } on FirebaseAuthException catch (e) {
                      // ログインに失敗した場合
                      setState(() {
                        _infoText = AuthException(e.code).toString();
                      });
                    }
                  }),
            ),

            // Googleログインボタン
            Padding(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 25.0),
                child: SignInButton(Buttons.google, onPressed: () async {
                  setState(() {
                    _isSigningIn = true;
                  });

                  User? user = await _signInGoogle(context: context);

                  setState(() {
                    _isSigningIn = false;
                  });

                  if (user != null && context.mounted) {
                    context.go('/main');
                  }
                })),

            // 区切り線
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 50,
              indent: 20,
              endIndent: 20,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              // アカウント作成ボタン
              child: ElevatedButton(
                  child: const Text('アカウントを作成する'),
                  onPressed: () {
                    context.push('/registration');
                  }),
            ),

            // 開発用
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
              child: ElevatedButton(
                  child: const Text('開発用：ログインスキップ'),
                  onPressed: () {
                    context.go('/main');
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<User?> _signInGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user!;
        final notifier = ref.read(userListNotifierProvider.notifier);
        notifier.addUser(user.uid);
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user!;
          final notifier = ref.read(userListNotifierProvider.notifier);
          notifier.addUser(user.uid);
        } on FirebaseAuthException catch (e) {
          setState(() {
            _infoText = AuthException(e.code).toString();
          });
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }
}
