import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants.dart';
import '../router/router.dart';
import 'app_theme.dart';

class MoneyTraceApp extends ConsumerWidget {
  const MoneyTraceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: kAppName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
    );
  }
}
