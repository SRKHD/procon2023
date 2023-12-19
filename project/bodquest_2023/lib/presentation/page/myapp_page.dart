import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'myhome_page.dart';
import 'registration_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    // パス (アプリが起動したとき)
    initialLocation: '/login',
    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LogInPage(),
      ),
      GoRoute(
        path: '/registration',
        builder: (context, state) => RegistrationPage(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) =>
            MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
