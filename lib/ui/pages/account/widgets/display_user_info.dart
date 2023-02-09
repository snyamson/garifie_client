import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/auth.dart';
import 'package:garifie_client/ui/pages/account/widgets/account_tile.dart';
import 'package:garifie_client/ui/pages/account/widgets/no_delivery_address_error.dart';
import 'package:garifie_client/ui/pages/account/widgets/orders_count.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/theme/app_colors.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';

import 'package:nb_utils/nb_utils.dart';

class DisplayUserInfo extends ConsumerWidget {
  const DisplayUserInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileProvider);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical:
            user.address == null ? Dimensions.height8 / 2 : Dimensions.height16,
        horizontal: 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          user.address == null ? const NoDeliveryAddressError() : Container(),
          user.address == null
              ? SizedBox(height: Dimensions.height16)
              : Container(),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius10 * 8),
              child: Container(
                color: appShadowColor,
                alignment: Alignment.center,
                height: Dimensions.height50 * 2,
                width: Dimensions.width50 * 2,
                child: Text(
                  user.username.isNotEmpty
                      ? user.username.substring(0, 2).toUpperCase()
                      : '',
                  style: boldTextStyle(size: (Dimensions.font10 * 4).toInt()),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height16),
          Text(user.username, style: primaryTextStyle()),
          SizedBox(height: Dimensions.height16),
          const OrdersCount(
            processingCount: '3',
            shippedCount: '5',
            deliveredCount: '3',
          ),
          SizedBox(height: Dimensions.height16),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width16,
              right: Dimensions.width16,
            ),
            child: Column(
              children: const [
                AccountTile(
                  title: 'My Orders',
                ),
                AccountTile(
                  title: 'Delivery Address',
                ),
                AccountTile(
                  title: 'Feedback',
                ),
                AccountTile(
                  title: 'Settings',
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.height16),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width16,
              right: Dimensions.width16,
            ),
            child: Button(
              context: context,
              title: 'Log Out',
              onPressed: () {
                ref.read(authProvider).logoutUser(context, ref);
              },
            ),
          ),
        ],
      ),
    );
  }
}
