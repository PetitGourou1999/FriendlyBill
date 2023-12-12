import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/navigation.dart';
import '../beans/destination.dart';
import '../ui/bottom_nav_page.dart';

class NavigationProvider {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static late final List<Destination> _allDestinations;
  static late final List<GlobalKey<NavigatorState>> _navigatorKeys;

  static late final GoRouter router;

  static final NavigationProvider _instance = NavigationProvider._internal();

  static NavigationProvider get instance => _instance;
  factory NavigationProvider() {
    return _instance;
  }

  NavigationProvider._internal() {
    _allDestinations = DestinationsConstants.availableDestinations;
    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        _allDestinations.length, (int index) => GlobalKey()).toList();

    final routes = [
      StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          branches: _allDestinations.map((Destination destination) {
            return StatefulShellBranch(
              navigatorKey: _navigatorKeys[destination.index],
              routes: [
                GoRoute(
                  path: destination.route,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return getPage(
                      child: destination.page,
                      state: state,
                    );
                  },
                )
              ],
            );
          }).toList(),
          pageBuilder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return getPage(
              child: BottomNavigationPage(
                allDestinations: _allDestinations,
                child: navigationShell,
              ),
              state: state,
            );
          })
    ];

    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.bills,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
