import 'package:bodquest_2023/presentation/page/meal/meal_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../page/base_root_page.dart';
import '../page/login_page.dart';
import '../page/meal/meal_edit_page.dart';
import '../page/menu/menu_list_page.dart';
import '../page/registration_page.dart';
import '../page/training/training_edit_page.dart';
import '../page/training/training_list_page.dart';
import '../page/weight/weight_edit_page.dart';
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
        builder: (context, state) => BaseRootPage(),
      ),
      GoRoute(
        path: PageId.weightlist.path,
        name: PageId.weightlist.routeName,
        builder: (context, state) {
          return WeightListPage();
        },
      ),
      GoRoute(
        path: PageId.weightedit.path,
        name: PageId.weightedit.routeName,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return WeightEditPage(id);
        },
      ),
      GoRoute(
        path: PageId.traininglist.path,
        name: PageId.traininglist.routeName,
        builder: (context, state) {
          return TrainingListPage();
        },
      ),
      GoRoute(
        path: PageId.trainingedit.path,
        name: PageId.trainingedit.routeName,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return TrainingEditPage(id);
        },
      ),
      GoRoute(
        path: PageId.meallist.path,
        name: PageId.meallist.routeName,
        builder: (context, state) {
          return MealListPage();
        },
      ),
      GoRoute(
        path: PageId.mealedit.path,
        name: PageId.mealedit.routeName,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return MealEditPage(id);
        },
      ),
      GoRoute(
        path: PageId.recipelist.path,
        name: PageId.recipelist.routeName,
        builder: (context, state) {
          return MenuListPage();
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
