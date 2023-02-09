import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/ui/pages/account/widgets/orders_count.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/routes/app_pages.dart';
import 'package:garifie_client/utils/theme/app_colors.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class DisplayNoUser extends ConsumerWidget {
  const DisplayNoUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height8 / 2,
        horizontal: 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: Dimensions.height16),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius10 * 8),
              child: Container(
                color: appShadowColor,
                alignment: Alignment.center,
                height: Dimensions.height50 * 2,
                width: Dimensions.width50 * 2,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height16),
          Text(
            ' Oops No User',
            style: boldTextStyle(color: Colors.redAccent),
          ),
          SizedBox(height: Dimensions.height16),
          const OrdersCount(),
          SizedBox(height: Dimensions.height16),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width16,
              right: Dimensions.width16,
            ),
            child: Button(
              context: context,
              title: 'Sign In',
              onPressed: () {
                context.pushNamed(Routes.signIn);
              },
            ),
          ),
        ],
      ),
    );
  }
}
