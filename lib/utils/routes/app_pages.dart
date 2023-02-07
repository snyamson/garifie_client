import 'package:flutter/material.dart';
import 'package:garifie_client/ui/pages/auth/views/log_in_view.dart';
import 'package:garifie_client/ui/pages/dashboard/views/dashboard_view.dart';
import 'package:garifie_client/ui/pages/home/views/home_view.dart';
import 'package:garifie_client/ui/pages/order_confirmation/views/order_confirmation_view.dart';
import 'package:garifie_client/ui/pages/product_detail/views/product_detail_view.dart';
import 'package:garifie_client/ui/shared/widgets/keep_alive_wrapper.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');

class AppPages {
  final GoRouter routes = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: Routes.dashboard,
    routes: [
      GoRoute(
          name: Routes.dashboard,
          path: Routes.dashboard,
          builder: (_, state) => const DashboardView()),
      GoRoute(
        name: Routes.home,
        path: Routes.home,
        pageBuilder: (_, state) => NoTransitionPage(
          child: KeepAliveWrapper(
            child: HomeView(
              key: state.pageKey,
            ),
          ),
        ),
        routes: [
          GoRoute(
            name: Routes.productDetail,
            path: Routes.productDetail,
            builder: (_, state) => const ProductDetailView(),
          ),
        ],
      ),
      GoRoute(
        name: Routes.signIn,
        path: Routes.signIn,
        builder: (_, state) => const LoginView(),
      ),
      GoRoute(
        name: Routes.confirmOrder,
        path: Routes.confirmOrder,
        builder: (_, state) => const OrderConfirmationView(),
      ),
    ],
  );
}
