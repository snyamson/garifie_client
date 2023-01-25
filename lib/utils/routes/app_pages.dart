import 'package:flutter/material.dart';
import 'package:garifie_client/ui/pages/account/views/account_view.dart';
import 'package:garifie_client/ui/pages/cart/views/cart_view.dart';
import 'package:garifie_client/ui/pages/dashboard/views/dashboard_view.dart';
import 'package:garifie_client/ui/pages/home/views/home_view.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

class AppPages {
  final GoRouter routes = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: Routes.home,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (_, state, child) => DashboardView(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          GoRoute(
            name: Routes.home,
            path: Routes.home,
            pageBuilder: (_, state) => NoTransitionPage(
              child: HomeView(
                key: state.pageKey,
              ),
            ),
          ),
          GoRoute(
            name: Routes.account,
            path: Routes.account,
            pageBuilder: (_, state) => NoTransitionPage(
              child: AccountView(
                key: state.pageKey,
              ),
            ),
          ),
          GoRoute(
            name: Routes.cart,
            path: Routes.cart,
            pageBuilder: (_, state) => NoTransitionPage(
              child: CartView(
                key: state.pageKey,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
