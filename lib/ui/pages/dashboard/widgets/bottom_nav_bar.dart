import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/cart.dart';
import 'package:garifie_client/core/providers/dashboard.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(dashboardNotifierProvider);
    final cartItemsLength = ref.watch(cartProvider).length;
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
            activeIcon: Icon(Icons.home)),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.search),
        //     label: '',
        //     activeIcon: Icon(Icons.search)),

        // BottomNavigationBarItem(
        //     icon: Icon(Icons.favorite_border),
        //     label: '',
        //     activeIcon: Icon(Icons.favorite)),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
            activeIcon: Icon(Icons.person)),
        BottomNavigationBarItem(
          icon: cartItemsLength != 0
              ? Badge(
                  badgeContent: Text(cartItemsLength.toString()),
                  badgeStyle: const BadgeStyle(
                    elevation: 0,
                    badgeColor: Colors.transparent,
                  ),
                  child: const Icon(Icons.shopping_cart),
                )
              : const Icon(Icons.shopping_cart_outlined),
          label: '',
          activeIcon: cartItemsLength != 0
              ? Badge(
                  badgeContent: Text(cartItemsLength.toString()),
                  badgeStyle: const BadgeStyle(
                    elevation: 0,
                    badgeColor: Colors.transparent,
                  ),
                  child: const Icon(Icons.shopping_cart),
                )
              : const Icon(Icons.shopping_cart),
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
      unselectedItemColor: const Color(0xff9e9e9e),
      selectedItemColor: context.iconColor,
      iconSize: Dimensions.iconSize24,
      selectedFontSize: Dimensions.height16 - 2,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedFontSize: Dimensions.height16 - 2,
      type: BottomNavigationBarType.fixed,
    );
  }

  void onTap(index) {
    ref.read(dashboardNotifierProvider.notifier).onChangeIndex(index);
  }
}
