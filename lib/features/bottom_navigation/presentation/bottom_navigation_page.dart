import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/strings.dart';
import '../../../router/routes.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key, required this.child});

  final Widget child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: BottomNavigationStrings.kHome,
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            selectedIcon: Icon(Icons.dashboard_customize_outlined),
            label: BottomNavigationStrings.kDashboard,
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            selectedIcon: Icon(Icons.notifications_outlined),
            label: BottomNavigationStrings.kNotification,
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person_outline_outlined),
            label: BottomNavigationStrings.kProfile,
          ),
        ],
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int index) => _onItemTapped(index, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    print("location::: $location");
    if (location.startsWith(RouteLocation.home)) {
      return 0;
    }
    if (location.startsWith(RouteLocation.dashboard)) {
      return 1;
    }
    if (location.startsWith(RouteLocation.notifications)) {
      return 2;
    }
    if (location.startsWith(RouteLocation.profilePage)) {
      return 3;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(RouteName.home);
      case 1:
        context.goNamed(RouteName.dashboard);
      case 2:
        context.goNamed(RouteName.notifications);
      case 3:
        context.goNamed(RouteName.profilePage);
    }
  }
}
