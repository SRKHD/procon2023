import 'package:bodquest_2023/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/control/browser_adapter.dart';
import '../router/go_router.dart';
import '../theme/fonts.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return BrowserAdapter(child: child);
      },
      theme: ThemeData(
        fontFamily: BrandText.bodyS.fontFamily,
        colorSchemeSeed: BrandColor.moriGreen,
      ),
    );
  }
}
