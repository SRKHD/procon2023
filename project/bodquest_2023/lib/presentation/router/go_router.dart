import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../page/login_page.dart';
import '../page/myhome_page.dart';
import '../page/registration_page.dart';
import '../page/training/training_list_page.dart';
import '../page/weight/weight_list_page.dart';
import 'page_path.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    final routes = [
      GoRoute(
        path: PageId.login.path,
        name: PageId.login.routeName,
        builder: (context, state) {
          return LogInPage();
        },
      ),
      GoRoute(
        path: PageId.registration.path,
        name: PageId.registration.routeName,
        builder: (context, state) {
          return RegistrationPage();
        },
      ),
      GoRoute(
        path: PageId.main.path,
        name: PageId.main.routeName,
        builder: (context, state) =>
            MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: PageId.weightlist.path,
        name: PageId.weightlist.routeName,
        builder: (context, state) {
          //final weights = state.pathParameters['weights']!;
          return WeightListPage();
        },
      ),
      GoRoute(
        path: PageId.traininglist.path,
        name: PageId.traininglist.routeName,
        builder: (context, state) {
          //final weights = state.pathParameters['weights']!;
          return TrainingListPage();
        },
      ),
    ];

    return GoRouter(
      initialLocation: PageId.login.path,
      debugLogDiagnostics: false,
      routes: routes,
    );
  },
);
