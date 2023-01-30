import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/dashboard.dart';
import 'package:garifie_client/ui/pages/account/views/account_view.dart';
import 'package:garifie_client/ui/pages/cart/views/cart_view.dart';
import 'package:garifie_client/ui/pages/dashboard/widgets/bottom_nav_bar.dart';
import 'package:garifie_client/ui/pages/home/views/home_view.dart';
import 'package:garifie_client/ui/shared/widgets/keep_alive_wrapper.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(dashboardNotifierProvider);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          KeepAliveWrapper(child: HomeView()),
          KeepAliveWrapper(child: AccountView()),
          KeepAliveWrapper(child: CartView()),
        ],
      ),
    );
  }
}
