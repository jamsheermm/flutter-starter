import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money_trace/features/auth/forgot_password/forgot_password_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/provider/shared_preferences.dart';
import '../core/shared_preferences_keys.dart';
import '../features/auth/login/presentation/login_page.dart';
import '../features/bottom_navigation/presentation/bottom_navigation_page.dart';
import '../features/dashboard/presentation/dashboard_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/notifications/presentation/notifications_page.dart';
import '../features/profile/presentation/profile_page.dart';
import 'routes.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteLocation.root,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RouteLocation.root,
        name: RouteName.root,
        redirect: (ctx, state) async {
// ignore: avoid_manual_providers_as_generated_provider_dependency
          final prefs = await ref.watch(sharedPrefsProvider.future);
          final isAuthenticated =
              prefs.getBool(SharedPreferencesKeys.kIsLoggedIn);
          if (isAuthenticated != null && isAuthenticated == true) {
            return RouteLocation.home;
          }
          return RouteLocation.login;
        },
      ),
      GoRoute(
        path: RouteLocation.login,
        name: RouteName.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: RouteLocation.forgotPassword,
        name: RouteName.forgotPassword,
        builder: (BuildContext context, GoRouterState state) {
          return const ForgotPasswordPage();
        },
      ),

      //Bottom navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BottomNavigationPage(
            key: state.pageKey,
            child: child,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteLocation.home,
            name: RouteName.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: RouteLocation.dashboard,
            name: RouteName.dashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const DashboardPage();
            },
          ),
          GoRoute(
            path: RouteLocation.notifications,
            name: RouteName.notifications,
            builder: (BuildContext context, GoRouterState state) {
              return const NotificationsPage();
            },
          ),
          GoRoute(
            path: RouteLocation.profilePage,
            name: RouteName.profilePage,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
        ],
      ),

    ],
  );
}
