import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 入力したメールアドレス・パスワード
  // String _email = '';
  // String _password = '';
  // Googleアカウントの表示名
  String _displayName = "";

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Hello $_displayName", style: TextStyle(fontSize: 50)),
        TextButton(
          // ボタンを押した時のイベント
          onPressed: () async {
            try {
              final credential = await signInWithGoogle();
              // final credential = await FirebaseAuth.instance
              //     .signInWithEmailAndPassword(
              //         email: emailAddress, password: password);

              // 認証情報をFirebaseに登録
              User? user = credential.user;
              if (user != null) {
                setState(() {
                  // 画面を更新
                  _displayName = user.displayName!;
                });
              }
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
            // // Google認証
            // GoogleSignInAccount? signinAccount = await googleLogin.signIn();
            // if (signinAccount == null) return;
            // GoogleSignInAuthentication auth =
            //     await signinAccount.authentication;
            // final OAuthCredential credential = GoogleAuthProvider.credential(
            //   idToken: auth.idToken,
            //   accessToken: auth.accessToken,
            // );
            // // 認証情報をFirebaseに登録
            // User? user =
            //     (await FirebaseAuth.instance.signInWithCredential(credential))
            //         .user;
            // if (user != null) {
            //   setState(() {
            //     // 画面を更新
            //     _displayName = user.displayName!;
            //   });
            // }
          },
          child: const Text(
            'login',
            style: const TextStyle(fontSize: 50),
          ),
        ),
        TextButton(
          // ボタンを押した時のイベント
          onPressed: () {
            FirebaseFirestore.instance
                .doc('testCollection1/testDocument1')
                .get()
                .then((ref) {
              print(ref.get("testField1"));
            });
            /* ここにプログラムを記載 */
            // データの取得
            // final collection =
            //     FirebaseFirestore.instance.collection('testCollection1');
            // final doc = collection.doc('testDocument1');
            // doc.get().then((value) {
            //   print(value.get('testField1'));
            // });
            // FirebaseFirestore.instance
            //     .collection('testCollection1')
            //     .doc('testDocument1')
            //     .get()
            //     .then((ref) {
            //   print(ref.get("testField1"));
            // });
          },
          child: const Text(
            '実行',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ]),
    ));
  }
}
