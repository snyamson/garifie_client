import 'package:flutter/material.dart';
import 'package:garifie_client/core/models/delivery_address.dart';
import 'package:garifie_client/ui/pages/auth/views/log_in_view.dart';
import 'package:garifie_client/ui/pages/dashboard/views/dashboard_view.dart';
import 'package:garifie_client/ui/pages/delivery_address/views/add_new_address_view.dart';
import 'package:garifie_client/ui/pages/delivery_address/views/delivery_address_view.dart';
import 'package:garifie_client/ui/pages/feedback/views/feedback_view.dart';
import 'package:garifie_client/ui/pages/home/views/home_view.dart';
import 'package:garifie_client/ui/pages/my_orders/views/my_orders_view.dart';
import 'package:garifie_client/ui/pages/order_confirmation/views/order_confirmation_view.dart';
import 'package:garifie_client/ui/pages/product_detail/views/product_detail_view.dart';
import 'package:garifie_client/ui/pages/settings/views/settings_view.dart';
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
      GoRoute(
        name: Routes.deliveryAddress,
        path: Routes.deliveryAddress,
        builder: (_, state) => const DeliveryAddressView(),
        routes: [
          GoRoute(
            name: Routes.addNewAddress,
            path: Routes.addNewAddress,
            builder: (_, state) => AddNewAddressView(
              addressToEdit:
                  state.extra != null ? state.extra as DeliveryAddress : null,
            ),
          ),
        ],
      ),
      GoRoute(
        name: Routes.myOrders,
        path: Routes.myOrders,
        builder: (_, state) => const MyOrdersView(),
      ),
      GoRoute(
        name: Routes.feedback,
        path: Routes.feedback,
        builder: (_, state) => const FeedbackView(),
      ),
      GoRoute(
        name: Routes.settings,
        path: Routes.settings,
        builder: (_, state) => const SettingsView(),
      ),
    ],
  );
}
